{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Segments.Implementation
  ( -- *
    toImplementation
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Segments.Types

import           Data.List.NonEmpty                     as NE (toList)
import           Formatting

toImplementation :: NonEmpty Dependency -> [Text]
toImplementation = haskellList . fmap callDependency . NE.toList

callDependency :: Dependency -> Text
callDependency (Dependency pos (Simple code _ presence _ _)) =
  sformat ( quoted fPosition % " .@ " % fPresence % " simple" % fSimpleCode) pos presence code
callDependency (Dependency pos (Composite code _ presence)) =
  sformat ( quoted fPosition % " .@ " % fPresence % " composite" % fCompositeCode) pos presence code
