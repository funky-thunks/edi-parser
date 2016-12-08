{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8154
  ( simple8154
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8154  Equipment size and type
-- >
-- >    Desc: Plain language description of the size and type of equipment
-- >          e.g. unit load device.
-- >
-- >    Repr: an..35
simple8154 :: Parser Value
simple8154 = simple "8154" (alphaNumeric `upTo` 35)
