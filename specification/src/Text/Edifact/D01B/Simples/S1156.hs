{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1156
  ( simple1156
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1156  Document line identifier                                [C]
-- >
-- >      Desc: To identify a line of a document.
-- >
-- >      Repr: an..6
simple1156 :: Parser Value
simple1156 = simple "1156" (alphaNumeric `upTo` 6)
