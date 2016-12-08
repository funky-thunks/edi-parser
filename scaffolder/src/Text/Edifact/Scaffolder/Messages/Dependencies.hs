{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Messages.Dependencies
  ( -- *
    mkDependenciesHaddock
  , mkDependenciesImports
  , mkDependenciesReexports
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Messages.Types

import           Control.Monad                          ((>=>))
import           Data.List                              (isPrefixOf)
import           Data.List.NonEmpty                     as NE (nonEmpty, toList)
import           Data.Maybe                             (mapMaybe)

unlessIsCommon :: SegmentCode -> Maybe SegmentCode
unlessIsCommon sc@(SegmentCode code) | "U" `isPrefixOf` code = Nothing
                                     | otherwise             = Just sc

mkDependenciesReexports :: NonEmpty Element -> Scaffolding [Export]
mkDependenciesReexports = mkSegmentDependencies mkSegmentDependenciesReexports

mkSegmentDependenciesReexports :: NonEmpty SegmentCode -> Scaffolding [Export]
mkSegmentDependenciesReexports = reexportDependencies fSegmentParserFunction

mkDependenciesImports :: NonEmpty Element -> Scaffolding [ImportGroup]
mkDependenciesImports = mkSegmentDependencies mkSegmentDependenciesImports

mkSegmentDependencies :: (NonEmpty SegmentCode -> Scaffolding [output])
                      -> (NonEmpty Element     -> Scaffolding [output])
mkSegmentDependencies mk = maybe (pure []) mk . filterSegmentDependencies

filterSegmentDependencies :: NonEmpty Element -> Maybe (NonEmpty SegmentCode)
filterSegmentDependencies =
  fmap nub . nonEmpty . mapMaybe (getSegment >=> unlessIsCommon) . NE.toList

mkSegmentDependenciesImports :: NonEmpty SegmentCode -> Scaffolding [ImportGroup]
mkSegmentDependenciesImports =
  fmap (pure . singleImport) . importDependencies "Segments" fSegmentParserFunction

mkDependenciesHaddock :: NonEmpty Element -> Scaffolding [Text]
mkDependenciesHaddock = mkSegmentDependencies mkSegmentDependenciesHaddock

mkSegmentDependenciesHaddock :: NonEmpty SegmentCode -> Scaffolding [Text]
mkSegmentDependenciesHaddock = haddockDependencies fSegmentParserFunction
