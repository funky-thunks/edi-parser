{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8077
  ( simple8077
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8077  Equipment supplier, coded
-- >
-- >   Desc: To indicate the party that is the supplier of the equipment.
-- >
-- >   Repr: an..3
-- >
-- >         1 Shipper supplied
-- >              The transport equipment is supplied by the shipper.
-- >         2 Carrier supplied
-- >              The transport equipment is supplied by the carrier.
simple8077 :: Parser Value
simple8077 = simple "8077" (alphaNumeric `upTo` 3)
