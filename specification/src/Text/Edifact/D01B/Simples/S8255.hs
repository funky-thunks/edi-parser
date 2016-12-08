{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8255
  ( simple8255
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8255  Packing instruction type code                           [B]
-- >
-- >      Desc: Code specifying a type of packing instruction.
-- >
-- >      Repr: an..3
simple8255 :: Parser Value
simple8255 = simple "8255" (alphaNumeric `upTo` 3)
