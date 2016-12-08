{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Simples.Implementation
  ( -- *
    toImplementation
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Simples.Types

import           Formatting

toImplementation :: Representation -> Text
toImplementation (Representation content (UpTo n)   ) = sformat (fContent % " `upTo` " % int) content n
toImplementation (Representation content (Exactly n)) = sformat (fContent % " `exactly` " % int) content n
toImplementation (Representation content AnyNumber  ) = sformat ("many " % fContent) content

fContent :: Format t (Content -> t)
fContent =
  let display AlphaNumeric = "alphaNumeric"
      display Alpha        = "alpha"
      display Numeric      = "numeric"
  in mapf display stext
