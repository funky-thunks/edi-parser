{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Messages
  ( messages
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Messages.Dependencies
import           Text.Edifact.Scaffolder.Messages.Elements
import           Text.Edifact.Scaffolder.Messages.Implementation
import           Text.Edifact.Scaffolder.Messages.Specification
import           Text.Edifact.Scaffolder.Messages.Types

import           Formatting

messages :: Scaffolding ()
messages = listMessages >>= scaffoldElements parentMessageModule messageModule

parentMessageModule :: NonEmpty (ElementWithDefinition MessageCode) -> Scaffolding ()
parentMessageModule = parentModule "Messages" "M" messageModuleName

messageModuleName :: ModuleName -> MessageCode -> ModuleName
messageModuleName mn code = mn <.> fromString (getMessageCode code)

messageModule :: ElementWithDefinition MessageCode -> Scaffolding ()
messageModule (inputFile, code) = do
  moduleName <- getRootModuleNameFor (messageModuleName "Messages" code)
  dependencies <- scanDependencies inputFile specificationParser
  specification <- includeSpecification inputFile
  let parserFunction = fMessageParserFunction
      fDescription = "Message " % fMessageCode
      parserNotYetImplemented = sformat (notYetImplemented fDescription) code
      defaultImplementation = haskellList [ parserNotYetImplemented ]
      elements = sort . nub . fmap getElement <$> dependencies
      implementation = maybe defaultImplementation (toImplementation code) dependencies
      buildDependencies b = fromMaybe [] <$> traverse b elements
  dependenciesReexports <- buildDependencies mkDependenciesReexports
  dependenciesImports   <- buildDependencies mkDependenciesImports
  dependenciesHaddock   <- buildDependencies mkDependenciesHaddock
  let exports = Comment "* Definition"
              : Name (sformat parserFunction code)
              : dependenciesReexports
      segmentImport = singleImport (ImportAll "Text.Edifact.Common.Segments")
      imports = maybe importNotYetImplementedHelper (const segmentImport) dependencies
              : dependenciesImports
             <> [ importCombinators ]
      documentation = specification <> dependenciesHaddock
      signature = sformat (fParserSignature parserFunction) code
      definition = [ sformat (fParserDeclaration parserFunction) code
                   , indent (sformat ("message " % quoted fMessageCode) code)
                   ] <> (indent . indent <$> implementation)
      parser = signature : definition
  scaffoldModule moduleName ["OverloadedStrings"] exports imports (documentation <> parser)
