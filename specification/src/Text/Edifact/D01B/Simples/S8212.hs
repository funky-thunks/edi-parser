{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8212
  ( simple8212
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8212  Transport means identification name                     [B]
-- >
-- >      Desc: Name identifying a means of transport.
-- >
-- >      Repr: an..35
simple8212 :: Parser Value
simple8212 = simple "8212" (alphaNumeric `upTo` 35)
