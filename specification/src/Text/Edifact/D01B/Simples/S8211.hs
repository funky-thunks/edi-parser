{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8211
  ( simple8211
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8211  Hazardous cargo transport authorisation code            [B]
-- >
-- >      Desc: Code specifying the authorisation for the
-- >            transportation of hazardous cargo.
-- >
-- >      Repr: an..3
simple8211 :: Parser Value
simple8211 = simple "8211" (alphaNumeric `upTo` 3)
