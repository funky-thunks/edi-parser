{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8077
  ( simple8077
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8077  Equipment supplier code                                 [B]
-- >
-- >      Desc: Code specifying the party that is the supplier of the
-- >            equipment.
-- >
-- >      Repr: an..3
-- >
-- >      1     Shipper supplied
-- >               The transport equipment is supplied by the shipper.
-- >
-- >      2     Carrier supplied
-- >               The transport equipment is supplied by the carrier.
-- >
-- >      3     Consolidator supplied
-- >               The equipment is supplied by the consolidator.
-- >
-- >      4     Deconsolidator supplied
-- >               The equipment is supplied by the deconsolidator.
-- >
-- >      5     Third party supplied
-- >               The equipment is supplied by a third party.
-- >
-- >      6     Forwarder supplied from a leasing company
-- >               The equipment is supplied by the forwarder and is taken
-- >               from a leasing company.
-- >
-- >      7     Forwarder supplied from the railways' pool
-- >               The equipment is supplied by the forwarder and is taken
-- >               from a pool established by railway companies.
simple8077 :: Parser Value
simple8077 = simple "8077" (alphaNumeric `upTo` 3)
