{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8335
  ( simple8335
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8335  Movement type, coded
-- >
-- >   Desc: Code indicating the type of movement.
-- >
-- >   Repr: an..3
-- >
-- >         1 Breakbulk
-- >              Defines the movement of general cargo not carried in ISO
-- >              standard containers.
-- >         2 LCL/LCL
-- >              Defines the movement of cargo packed in and unpacked from
-- >              containers by the carrier on behalf of the
-- >              shipper/consignee. 'LCL' means Less than Container Load.
-- >         3 FCL/FCL
-- >              Defines the movement of cargo packed by the shipper or
-- >              shipper's agent and unpacked by the consignee or
-- >              consignee's agent. 'FCL' means Full Container Load.
-- >         4 FCL/LCL
-- >              Defines the movement of cargo packed by the shipper or
-- >              shipper's agent and unpacked by the carrier. 'FCL' means
-- >              Full Container Load. 'LCL' means Less than Container
-- >              Load.
-- >         5 LCL/FCL
-- >              Defines the movement of cargo packed by the carrier and
-- >              unpacked by the consignee or consignee's agent. 'LCL'
-- >              means Less than Container Load. 'FCL' means Full Load.
-- >        11 House to house
-- >              Cargo packed in a unit by the shipper at point of origin
-- >              and unpacked by consignee at final destination.
-- >        12 House to terminal
-- >              Cargo packed in a unit by the shipper at point of origin
-- >              and unpacked at the carrier's inland facility between the
-- >              ship's point of discharge and the final destination.
-- >        13 House to pier
-- >              Cargo packed in a unit by the shipper at point of origin
-- >              and unpacked by carrier at ship's point of discharge
-- >              (pier).
-- >        21 Terminal to house
-- >              Cargo packed in a unit at a carrier's inland facility
-- >              between point of origin and the ship's point of loading
-- >              and unpacked by consignee at the final destination.
-- >        22 Terminal to terminal
-- >              Cargo packed in a unit at a carrier's inland facility
-- >              between point of origin and the ship's point of loading
-- >              and unpacked at a carrier's inland facility between
-- >              ship's point of discharge and final destination.
-- >        23 Terminal to pier
-- >              Cargo packed in a unit at a carrier's inland facility
-- >              between point of origin and ship's point of loading and
-- >              unpacked by carrier at ship's point of discharge (pier).
-- >        31 Pier to house
-- >              Cargo packed in a unit at ship's point of loading and
-- >              unpacked by consignee at final destination.
-- >        32 Pier to terminal
-- >              Cargo packed in a unit at ship's point of loading and
-- >              unpacked at a carrier's inland facility between ship's
-- >              point of discharge and final destination.
-- >        33 Pier to pier
-- >              Cargo packed in a unit at ship's point of loading and
-- >              unpacked by carrier at ship's point of discharge (pier).
-- >        41 Station to station
-- >              Self explanatory.
-- >        42 House to warehouse
-- >              Self explanatory.
-- >        43 Warehouse to house
-- >              Self explanatory.
-- >        44 Station to house
-- >              Self explanatory.
simple8335 :: Parser Value
simple8335 = simple "8335" (alphaNumeric `upTo` 3)
