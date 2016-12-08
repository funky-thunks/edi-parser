{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6154
  ( simple6154
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6154  Non-discrete measurement name                           [B]
-- >
-- >      Desc: Name of a non-discrete measurement.
-- >
-- >      Repr: an..70
simple6154 :: Parser Value
simple6154 = simple "6154" (alphaNumeric `upTo` 70)
