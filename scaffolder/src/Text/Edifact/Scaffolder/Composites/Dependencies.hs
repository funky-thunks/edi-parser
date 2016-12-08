{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Composites.Dependencies
  ( -- *
    mkDependenciesHaddock
  , mkDependenciesImports
  , mkDependenciesReexports
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Composites.Types

mkDependenciesReexports :: NonEmpty Element -> Scaffolding [Export]
mkDependenciesReexports = reexportDependencies fElement

mkDependenciesImports :: NonEmpty Element -> Scaffolding [ImportGroup]
mkDependenciesImports = fmap (pure . singleImport) . importDependencies "Simples" fElement

mkDependenciesHaddock :: NonEmpty Element -> Scaffolding [Text]
mkDependenciesHaddock = haddockDependencies fElement
