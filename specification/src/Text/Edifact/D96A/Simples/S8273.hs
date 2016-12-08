{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8273
  ( simple8273
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8273  Dangerous goods regulations, coded
-- >
-- >   Desc: Code indicating the regulation, international or national,
-- >         applicable for a means of transport.
-- >
-- >   Repr: an..3
-- >
-- >    ADR    European agreement regarding the total carriage of dangerous
-- >           goods
-- >              European agreement regarding the total carriage of
-- >              dangerous goods by road.
-- >    CFR    49 code of federal regulations
-- >              US federal regulations issued by the US Dept. of
-- >              transportation covering the domestic transportation of
-- >              dangerous goods by truck, rail, water and air.
-- >    ICA    IATA ICAO
-- >              Regulations covering the international transportation of
-- >              dangerous goods issued by the International Air Transport
-- >              Association and the International Civil Aviation
-- >              Organization.
-- >    IMD    IMO IMDG code
-- >              Regulations regarding the transportation of dangerous
-- >              goods on ocean-going vessels issued by the International
-- >              Maritime Organization.
-- >    RID    Rail/road dangerous goods book (RID)
-- >              International reglementation in dangerous goods
-- >              transportation, applicable in Rail and Road environment.
-- >              RID is the abbreviation of "Reglement International des
-- >              marchandises Dangereuses".
-- >    TEC    Transport emergency trem card
-- >              Description to be provided.
-- >    UI     UK IMO book
-- >              Description to be provided.
simple8273 :: Parser Value
simple8273 = simple "8273" (alphaNumeric `upTo` 3)
