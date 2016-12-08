{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Segments.Dependencies
  ( -- *
    mkDependenciesHaddock
  , mkDependenciesImports
  , mkDependenciesReexports
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Segments.Types

import           Data.List.NonEmpty                     as NE (nonEmpty, toList)
import           Data.Maybe                             (catMaybes, mapMaybe)
import           Formatting                             as F

mkDependenciesReexports :: NonEmpty Element -> Scaffolding [Export]
mkDependenciesReexports = reexportDependencies fElementFunction

mkDependenciesImports :: NonEmpty Element -> Scaffolding [ImportGroup]
mkDependenciesImports elements =
  let filterElements optic = mapMaybe optic . NE.toList
  in maybe [] (pure . ImportGroup) . nonEmpty . catMaybes <$>
       sequence
         [ mkCompositeDependenciesImports (filterElements getComposite elements)
         , mkSimpleDependenciesImports    (filterElements getSimple    elements)
         ]

mkSimpleDependenciesImports :: [SimpleCode] -> Scaffolding (Maybe Import)
mkSimpleDependenciesImports =
  ifNonEmpty (importDependencies "Simples" fSimpleParserFunction)

mkCompositeDependenciesImports :: [CompositeCode] -> Scaffolding (Maybe Import)
mkCompositeDependenciesImports =
  ifNonEmpty (importDependencies "Composites" fCompositeParserFunction)

ifNonEmpty :: Applicative f => (NonEmpty input -> f output) -> [input] -> f (Maybe output)
ifNonEmpty f = traverse f . nonEmpty

mkDependenciesHaddock :: NonEmpty Element -> Scaffolding [Text]
mkDependenciesHaddock = haddockDependencies fElementFunction

fElementFunction :: Format r (Element -> r)
fElementFunction =
  let buildElementFunction (Simple    code _ _ _ _) = bprint fSimpleParserFunction    code
      buildElementFunction (Composite code _ _)     = bprint fCompositeParserFunction code
  in later buildElementFunction
