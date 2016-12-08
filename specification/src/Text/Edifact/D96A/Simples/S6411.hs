{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6411
  ( simple6411
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6411  Measure unit qualifier
-- >
-- >    Desc: Indication of the unit of measurement in which weight (mass),
-- >          capacity, length, area, volume or other quantity is
-- >          expressed.
-- >
-- >    Repr: an..3
-- >
-- >    Note: See UN/ECE Recommendation 20.
simple6411 :: Parser Value
simple6411 = simple "6411" (alphaNumeric `upTo` 3)
