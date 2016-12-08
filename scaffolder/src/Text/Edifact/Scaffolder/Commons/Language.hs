{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedLists            #-}
{-# LANGUAGE OverloadedStrings          #-}

module Text.Edifact.Scaffolder.Commons.Language
  ( -- *
    saveHaskellModule
  , includeSpecification
    -- *
  , scaffoldModule
    -- *
  , getRootModuleName
  , getRootModuleNameFor
    -- *
  , scaffoldElements
  , ElementWithDefinition
    -- *
  , parentModule
    -- *
  , haddockDependencies
    -- *
  , reexportDependencies
    -- *
  , importDependencies
  , importCombinators
  , importNotYetImplementedHelper
    -- *
  , moduleDeclaration
  , Export(..)
    -- *
  , reexportAlias
  , singleImport
  , ImportGroup(..)
  , Import(..)
  , ImportName(..)
  , ModuleAlias(..)
  , LanguageExtension(..)
  ) where

import           Text.Edifact.Scaffolder.Commons.Formatters (fModuleName,
                                                             parens,
                                                             simpleQuoted)
import           Text.Edifact.Scaffolder.Commons.Logging    (say)
import           Text.Edifact.Scaffolder.Commons.Text       (commaSeparated,
                                                             extensions,
                                                             formatSpecification,
                                                             indent, newline)
import           Text.Edifact.Scaffolder.Commons.Types      (LanguageExtension (..),
                                                             ModuleName (..),
                                                             Scaffolding,
                                                             getRevision,
                                                             hostModule,
                                                             revision,
                                                             targetDirectory,
                                                             (<.>))

import           Control.Monad                              ((>=>))
import           Control.Monad.IO.Class                     (liftIO)
import           Control.Monad.Reader                       (asks)
import           Data.Bifunctor                             (bimap)
import           Data.Foldable                              (traverse_)
import           Data.List                                  (intercalate,
                                                             uncons)
import           Data.List.NonEmpty                         (NonEmpty, nonEmpty)
import qualified Data.List.NonEmpty                         as NE (cons, toList)
import           Data.List.Split                            (splitOn)
import           Data.String                                (IsString (..))
import           Data.Text                                  as T (Text, drop,
                                                                  lines,
                                                                  unlines)
import qualified Data.Text.IO                               as TIO (readFile,
                                                                    writeFile)
import           Data.Tuple                                 (swap)
import           Formatting                                 as F (Format,
                                                                  bprint, later,
                                                                  mapf, sformat,
                                                                  stext, (%))
import           System.Directory                           (createDirectoryIfMissing)
import           System.FilePath                            ((</>))
import           System.Process                             (callCommand)

getRootModuleName :: Scaffolding ModuleName
getRootModuleName =
  let prefix host rev = host <.> ModuleName (getRevision rev)
  in asks (prefix . hostModule) <*> asks revision

getRootModuleNameFor :: ModuleName -> Scaffolding ModuleName
getRootModuleNameFor name =
  let suffix root = root <.> name
  in suffix <$> getRootModuleName

saveHaskellModule :: ModuleName -> [Text] -> Scaffolding ()
saveHaskellModule mn body =
  let sources = T.unlines body
      saveModule file = liftIO (saveFile file >> stylishHaskell file)
      saveFile = flip TIO.writeFile sources
      stylishHaskell file = callCommand ("stylish-haskell -i " <> file)
      doNothing = pure ()
  in say ("module " % fModuleName) mn >> mkSourceFile mn >>= maybe doNothing saveModule

mkSourceFile :: ModuleName -> Scaffolding (Maybe FilePath)
mkSourceFile = locateSourceFile >=> traverse prepareHierarchy

type FileInDirectory = (Directory, FileName)
type Directory = FilePath
type FileName = FilePath

prepareHierarchy :: FileInDirectory -> Scaffolding FilePath
prepareHierarchy (directory, file) =
  let fullPath = directory </> file
  in fullPath <$ liftIO (createDirectoryIfMissing True directory)

locateSourceFile :: ModuleName -> Scaffolding (Maybe FileInDirectory)
locateSourceFile (ModuleName mn) =
  let hierarchy = splitOn "." mn
      toFile n = n <> ".hs"
      path :: Directory -> Maybe (Directory, FileName)
      path directory = fmap toFile . swap . fmap (foldl (</>) directory . reverse) <$> uncons (reverse hierarchy)
  in asks (path . targetDirectory)

includeSpecification :: FilePath -> Scaffolding [Text]
includeSpecification = fmap (formatSpecification . T.lines) . liftIO . TIO.readFile

type ElementWithDefinition elt = (FilePath, elt)

scaffoldElements :: (NonEmpty (ElementWithDefinition element) -> Scaffolding ())
                 -> (          ElementWithDefinition element  -> Scaffolding ())
                 -> ([         ElementWithDefinition element] -> Scaffolding ())
scaffoldElements parentScaffolder elementScaffolder =
  let doNothing = pure ()
      scaffolder elts = parentScaffolder elts >> traverse_ elementScaffolder elts
  in maybe doNothing scaffolder . nonEmpty

parentModule :: ModuleName -> ModuleAlias -> (ModuleName -> element -> ModuleName) -> NonEmpty (ElementWithDefinition element) -> Scaffolding ()
parentModule elementName alias nameModule elements =
  getRootModuleNameFor elementName >>= generateRootModule alias nameModule (snd <$> elements)

generateRootModule :: ModuleAlias -> (ModuleName -> element -> ModuleName) -> NonEmpty element -> ModuleName -> Scaffolding ()
generateRootModule alias nameModule codes mn =
  let importElement code = ImportAll (ImportAs (nameModule mn code) alias)
      imports = [ ImportGroup (importElement <$> codes) ]
      exports = [ reexportAlias alias ]
  in saveHaskellModule mn $
       moduleDeclaration mn exports imports

haddockDependencies :: Format Text (elt -> Text) -> NonEmpty elt -> Scaffolding [Text]
haddockDependencies formatter elts =
  let formattedDependencies = commaSeparated . fmap (sformat (simpleQuoted formatter))
      formatHaddock = sformat ("-- Dependencies: " % F.stext % ".")
  in pure [ "--"
          , formatHaddock (formattedDependencies elts)
          ]

reexportDependencies :: Format Text (elt -> Text) -> NonEmpty elt -> Scaffolding [Export]
reexportDependencies formatter =
  let mkReexport = Name . sformat formatter
      prependTitle = NE.cons (Comment "* Dependencies")
  in pure . NE.toList . prependTitle . fmap mkReexport

importDependencies :: ModuleName -> Format Text (elt -> Text) -> NonEmpty elt -> Scaffolding Import
importDependencies moduleName formatter elts =
  let imports = NE.toList (sformat formatter <$> elts)
      mkImport mn = Import (BasicImport mn) imports
  in mkImport <$> getRootModuleNameFor moduleName

importCombinators :: ImportGroup
importCombinators =
  ImportGroup
    [ ImportAll "Text.Edifact.Parsing"
    , Import    "Text.Edifact.Types"   [ "Value" ]
    ]

importNotYetImplementedHelper :: ImportGroup
importNotYetImplementedHelper =
  ImportGroup
    [ Import "Text.Edifact.Parsing.Commons" [ "notYetImplemented" ]
    ]

moduleDeclaration :: ModuleName -> [Export] -> [ImportGroup] -> [Text]
moduleDeclaration moduleName exports imports =
  let decl mn [] = [sformat ("module " % fModuleName % " where") mn]
      decl mn ex = sformat ("module " % fModuleName) mn
                 : renderExports ex
  in intercalate newline [ decl moduleName exports
                         , renderImports imports
                         ]

machineGeneratedWarning :: [Text]
machineGeneratedWarning =
  [ "---- Machine generated code."
  , "---- Output of edi-parser-scaffolder"
  ]

scaffoldModule :: ModuleName -> [LanguageExtension] -> [Export] -> [ImportGroup] -> [Text] -> Scaffolding ()
scaffoldModule mn exts exports imports code =
  saveHaskellModule mn $
    intercalate newline
      [ extensions exts
      , machineGeneratedWarning
      , moduleDeclaration mn exports imports
      , code
      ]

renderExports :: [Export] -> [Text]
renderExports exports =
  let formatExport (First e)     = sformat ("  " % fExport) e
      formatExport (Following e) = sformat (", " % fExport) e
      formatExport (Skipped e)   = sformat ("  " % fExport) e
      fExport =
        let f (Comment t) = bprint ("-- " % stext) t
            f (Name    t) = bprint stext t
        in later f
      parensOnFirstLine [] = []
      parensOnFirstLine (firstLine : rest) = ("(" <> T.drop 1 firstLine) : rest
      ls = parensOnFirstLine (formatExport <$> tag exports) <> [ ") where" ]
  in indent <$> ls

data Export = Name    Text
            | Comment Text

instance IsString Export where
  fromString = Name . fromString

data Tag a = First     a
           | Following a
           | Skipped   a

tag :: [Export] -> [Tag Export]
tag =
  let skipAll = fmap Skipped
      tagFirst []             = []
      tagFirst (elt : others) = First elt : tagOthers others
      tagOthers = fmap tagOther
      tagOther v | isComment v = Skipped v
                 | otherwise   = Following v
      merge (xs, ys) = xs <> ys
  in merge . bimap skipAll tagFirst . span isComment

isComment :: Export -> Bool
isComment (Comment _) = True
isComment _           = False

newtype ModuleAlias = ModuleAlias { getModuleAlias :: Text } deriving newtype (IsString)

singleImport :: Import -> ImportGroup
singleImport = ImportGroup . pure

newtype ImportGroup = ImportGroup (NonEmpty Import) deriving newtype Semigroup

data Import = Import    ImportName [Text]
            | ImportAll ImportName

data ImportName = BasicImport       ModuleName
                | ImportAs          ModuleName ModuleAlias
                | ImportQualified   ModuleName
                | ImportQualifiedAs ModuleName ModuleAlias

instance IsString ImportName where
  fromString = BasicImport . fromString

renderImports :: [ImportGroup] -> [Text]
renderImports = intercalate newline . fmap renderImportGroup

reexportAlias :: ModuleAlias -> Export
reexportAlias = Name . sformat ("module " % fModuleAlias)

renderImportGroup :: ImportGroup -> [Text]
renderImportGroup (ImportGroup imports) = NE.toList (renderImport <$> imports)

renderImport :: Import -> Text
renderImport (ImportAll name)            = sformat fImportName name
renderImport (Import    name references) =
  sformat (fImportName % " " % parens stext) name (commaSeparated references)

fImportName :: Format r (ImportName -> r)
fImportName =
  let
      build (BasicImport       name)       = bprint ("import " % fModuleName) name
      build (ImportAs          name alias) = bprint ("import " % fModuleName % " as " % fModuleAlias) name alias
      build (ImportQualified   name)       = bprint ("import qualified " % fModuleName) name
      build (ImportQualifiedAs name alias) = bprint ("import qualified " % fModuleName % " as " % fModuleAlias) name alias
  in later build

fModuleAlias :: Format r (ModuleAlias -> r)
fModuleAlias = mapf getModuleAlias stext
