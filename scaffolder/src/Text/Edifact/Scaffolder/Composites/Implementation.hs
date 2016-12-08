{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Composites.Implementation
  ( -- *
    toImplementation
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Composites.Types

import           Data.List.NonEmpty                       as NE (toList)
import           Formatting

toImplementation :: NonEmpty Dependency -> [Text]
toImplementation = haskellList . fmap callDependency . NE.toList

callDependency :: Dependency -> Text
callDependency (Dependency pos element presence) =
  sformat (quoted fPosition % " .@ " % fPresence % " " % fElement) pos presence element
