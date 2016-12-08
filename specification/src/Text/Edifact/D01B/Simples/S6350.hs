{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6350
  ( simple6350
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6350  Units quantity                                          [C]
-- >
-- >      Desc: To specify the number of units.
-- >
-- >      Repr: n..15
simple6350 :: Parser Value
simple6350 = simple "6350" (numeric `upTo` 15)
