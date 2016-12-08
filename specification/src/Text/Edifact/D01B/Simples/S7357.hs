{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7357
  ( simple7357
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7357  Commodity identification code                           [B]
-- >
-- >      Desc: Code identifying a commodity for Customs, transport or
-- >            statistical purposes (generic term).
-- >
-- >      Repr: an..18
simple7357 :: Parser Value
simple7357 = simple "7357" (alphaNumeric `upTo` 18)
