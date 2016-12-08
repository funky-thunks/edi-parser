{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Segments
  ( segments
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Segments.Dependencies
import           Text.Edifact.Scaffolder.Segments.Elements
import           Text.Edifact.Scaffolder.Segments.Implementation
import           Text.Edifact.Scaffolder.Segments.Specification
import           Text.Edifact.Scaffolder.Segments.Types

import           Data.List.NonEmpty                              (nubBy)
import           Formatting

segments :: Scaffolding ()
segments = listSegments >>= scaffoldElements parentSegmentModule segmentModule

parentSegmentModule :: NonEmpty (ElementWithDefinition SegmentCode) -> Scaffolding ()
parentSegmentModule = parentModule "Segments" "S" segmentModuleName

segmentModuleName :: ModuleName -> SegmentCode -> ModuleName
segmentModuleName mn code = mn <.> fromString (getSegmentCode code)

segmentModule :: ElementWithDefinition SegmentCode -> Scaffolding ()
segmentModule (inputFile, code) = do
  moduleName <- getRootModuleNameFor (segmentModuleName "Segments" code)
  dependencies <- scanDependencies inputFile (snd <$> specificationParser)
  specification <- includeSpecification inputFile
  let parserFunction = fSegmentParserFunction
      fDescription = "Segment " % fSegmentCode
      parserNotYetImplemented = sformat (notYetImplemented fDescription) code
      defaultImplementation = haskellList [ parserNotYetImplemented ]
      elements = sort . nubBy (\a b -> getCode a == getCode b) . fmap dependencyElement <$> dependencies
      implementation = maybe defaultImplementation toImplementation dependencies
      buildDependencies b = fromMaybe [] <$> traverse b elements
  dependenciesReexports <- buildDependencies mkDependenciesReexports
  dependenciesImports   <- buildDependencies mkDependenciesImports
  dependenciesHaddock   <- buildDependencies mkDependenciesHaddock
  let exports = Comment "* Definition"
              : Name (sformat parserFunction code)
              : dependenciesReexports
      imports = dependenciesImports
             <> [ importCombinators ]
             <> maybe [ importNotYetImplementedHelper ] (const []) dependencies
      documentation = specification <> dependenciesHaddock
      signature = sformat (fParserSignature parserFunction) code
      definition = [ sformat (fParserDeclaration parserFunction) code
                   , indent (sformat ("segment " % quoted fSegmentCode) code)
                   ] <> (indent . indent <$> implementation)
      parser = signature : definition
  scaffoldModule moduleName ["OverloadedStrings"] exports imports (documentation <> parser)
