{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Composites
  ( composites
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Composites.Dependencies
import           Text.Edifact.Scaffolder.Composites.Elements
import           Text.Edifact.Scaffolder.Composites.Implementation
import           Text.Edifact.Scaffolder.Composites.Specification
import           Text.Edifact.Scaffolder.Composites.Types

import           Formatting

composites :: Scaffolding ()
composites = listComposites >>= scaffoldElements parentCompositeModule compositeModule

parentCompositeModule :: NonEmpty (ElementWithDefinition CompositeCode) -> Scaffolding ()
parentCompositeModule = parentModule "Composites" "C" compositeModuleName

compositeModuleName :: ModuleName -> CompositeCode -> ModuleName
compositeModuleName mn code = mn <.> fromString (getCompositeCode code)

compositeModule :: ElementWithDefinition CompositeCode -> Scaffolding ()
compositeModule (inputFile, code) = do
  moduleName <- getRootModuleNameFor (compositeModuleName "Composites" code)
  dependencies <- scanDependencies inputFile (snd <$> specificationParser)
  specification <- includeSpecification inputFile
  let parserFunction = fCompositeParserFunction
      fDescription = "Composite " % fCompositeCode
      parserNotYetImplemented = sformat (notYetImplemented fDescription) code
      defaultImplementation = haskellList [ parserNotYetImplemented ]
      elements = sort . nub . fmap dependencyElement <$> dependencies
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
                   , indent (sformat ("composite " % quoted fCompositeCode) code)
                   ] <> (indent . indent <$> implementation)
      parser = signature : definition
  scaffoldModule moduleName ["OverloadedStrings"] exports imports (documentation <> parser)
