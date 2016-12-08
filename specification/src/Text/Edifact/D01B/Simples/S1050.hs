{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1050
  ( simple1050
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1050  Sequence position identifier                            [C]
-- >
-- >      Desc: To identify a position in a sequence.
-- >
-- >      Repr: an..10
simple1050 :: Parser Value
simple1050 = simple "1050" (alphaNumeric `upTo` 10)
