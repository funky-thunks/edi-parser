{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Simples
  ( simples
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Simples.Elements
import           Text.Edifact.Scaffolder.Simples.Implementation
import           Text.Edifact.Scaffolder.Simples.Representation

import           Formatting

simples :: Scaffolding ()
simples = listSimples >>= scaffoldElements parentSimpleModule simpleModule

parentSimpleModule :: NonEmpty (ElementWithDefinition SimpleCode) -> Scaffolding ()
parentSimpleModule = parentModule "Simples" "S" simpleModuleName

simpleModuleName :: ModuleName -> SimpleCode -> ModuleName
simpleModuleName mn code = mn <.> fromString ("S" <> getSimpleCode code)

simpleModule :: ElementWithDefinition SimpleCode -> Scaffolding ()
simpleModule (inputFile, code) = do
  moduleName <- getRootModuleNameFor (simpleModuleName "Simples" code)
  representation <- extractRepresentation inputFile
  specification <- includeSpecification inputFile
  let parserFunction = fSimpleParserFunction
      fDescription = "Simple " % fSimpleCode
      defaultImplementation = sformat (notYetImplemented fDescription) code
      implementation = maybe defaultImplementation toImplementation representation
      exports = [ Name (sformat parserFunction code) ]
      imports = importCombinators
              : maybe [importNotYetImplementedHelper] (const []) representation
      documentation = specification
      signature = sformat (fParserSignature parserFunction) code
      definition = [ sformat (fParserDeclaration parserFunction % " simple " % quoted fSimpleCode % " " % parens stext) code code implementation
                   ]
      parser = signature : definition
  scaffoldModule moduleName ["OverloadedStrings"] exports imports (documentation <> parser)
