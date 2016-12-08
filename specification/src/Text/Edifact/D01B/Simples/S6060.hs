{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6060
  ( simple6060
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6060  Quantity                                                [C]
-- >
-- >      Desc: Alphanumeric representation of a quantity.
-- >
-- >      Repr: an..35
simple6060 :: Parser Value
simple6060 = simple "6060" (alphaNumeric `upTo` 35)
