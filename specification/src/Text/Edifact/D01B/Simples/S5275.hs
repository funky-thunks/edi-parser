{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5275
  ( simple5275
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5275  Supplementary rate or tariff code                       [B]
-- >
-- >      Desc: Code specifying a supplementary rate or tariff.
-- >
-- >      Repr: an..6
simple5275 :: Parser Value
simple5275 = simple "5275" (alphaNumeric `upTo` 6)
