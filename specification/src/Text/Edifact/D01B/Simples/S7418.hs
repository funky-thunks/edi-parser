{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7418
  ( simple7418
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7418  Hazardous material category name                        [B]
-- >
-- >      Desc: Name of a kind of hazard for a material.
-- >
-- >      Repr: an..35
simple7418 :: Parser Value
simple7418 = simple "7418" (alphaNumeric `upTo` 35)
