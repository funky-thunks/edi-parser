{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5275
  ( simple5275
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    5275  Supplementary rate/tariff basis identification
-- >
-- >    Desc: Code identifying supplementary rate/tariff.
-- >
-- >    Repr: an..6
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple5275 :: Parser Value
simple5275 = simple "5275" (alphaNumeric `upTo` 6)
