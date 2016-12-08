{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8249
  ( simple8249
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8249  Equipment status code                                   [B]
-- >
-- >      Desc: Code specifying the status of equipment.
-- >
-- >      Repr: an..3
-- >
-- >      1     Continental
-- >               The equipment is or will be moving across a continent on
-- >               an intermodal or multimodal basis.
-- >
-- >      2     Export
-- >               Transport equipment to be exported on a marine vessel.
-- >
-- >      3     Import
-- >               Transport equipment to be imported on a marine vessel.
-- >
-- >      4     Remain on board
-- >               Transport equipment arriving on a marine vessel is to
-- >               remain on board.
-- >
-- >      5     Shifter
-- >               Transport equipment is to be shifted from one stowage
-- >               location on a marine vessel to another on the same
-- >               vessel.
-- >
-- >      6     Transhipment
-- >               Transport equipment is to be transferred from one marine
-- >               vessel to another.
-- >
-- >      7     Shortlanded
-- >               Transport equipment notified to arrive which did not
-- >               arrive on the means of transport.
-- >
-- >      8     Overlanded
-- >               Transport equipment not notified to arrive but which did
-- >               arrive on the means of transport.
-- >
-- >      9     Domestic
-- >               Transport equipment is used in domestic service.
-- >
-- >      10    Positioning
-- >               Equipment is being transported for positioning purposes.
-- >
-- >      11    Delivery
-- >               Equipment is being delivered.
-- >
-- >      12    Redelivery
-- >               Equipment is being redelivered.
-- >
-- >      13    Repair
-- >               The equipment is for repair.
-- >
-- >      14    Reloader
-- >               Transport equipment to be discharged and subsequently
-- >               reloaded on the same means of transport but in a
-- >               different stowage location.
simple8249 :: Parser Value
simple8249 = simple "8249" (alphaNumeric `upTo` 3)
