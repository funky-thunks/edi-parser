{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8051
  ( simple8051
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8051  Transport stage code qualifier                          [B]
-- >
-- >      Desc: Code qualifying a specific stage of transport.
-- >
-- >      Repr: an..3
-- >
-- >      1     Inland transport
-- >               Transport by which goods are moved from or to the
-- >               frontier, or between inland points.
-- >
-- >      2     At the statistical territory limit
-- >               Point by which the means of transport are presumed to
-- >               have left the statistical territory of despatch or to
-- >               have entered the statistical territory of arrival.
-- >
-- >      10    Pre-carriage transport
-- >               Transport by which the goods are moved prior to their
-- >               main carriage transport.
-- >
-- >      11    At border
-- >               Transport by which goods are moved to the Customs
-- >               frontier.
-- >
-- >      12    At departure
-- >               Transport by which goods are moved from the place of
-- >               departure.
-- >
-- >      13    At destination
-- >               Transport by which goods are moved at the place of
-- >               destination.
-- >
-- >      15    Main carriage - fourth carrier
-- >               The fourth carrier of the ordered transport.
-- >
-- >      16    Main carriage - fifth carrier
-- >               The fifth carrier of the ordered transport.
-- >
-- >      17    Main carriage - sixth carrier
-- >               The sixth carrier of the ordered transport.
-- >
-- >      18    Main carriage - seventh carrier
-- >               The seventh carrier of the ordered transport.
-- >
-- >      19    Main carriage - eighth carrier
-- >               The eighth carrier of the ordered transport.
-- >
-- >      20    Main-carriage transport
-- >               The primary stage in the movement of cargo from the
-- >               point of origin to the intended destination.
-- >
-- >      21    Main carriage - first carrier
-- >               The first carrier of the ordered transport when more
-- >               than one carrier is involved.
-- >
-- >      22    Main carriage - second carrier
-- >               The second carrier of the ordered transport when more
-- >               than one carrier is involved.
-- >
-- >      23    Main carriage - third carrier
-- >               The third carrier of the ordered transport when more
-- >               than one carrier is involved.
-- >
-- >      24    Inland waterway transport
-- >               Transport by which goods are moved via an inland body of
-- >               water.
-- >
-- >      25    Delivery carrier all transport
-- >               Carrier responsible from the point of origin to the
-- >               final delivery destination.
-- >
-- >      26    Second pre-carriage transport
-- >               Second transport by which the goods are moved prior to
-- >               their main carriage transport.
-- >
-- >      27    Pre-acceptance transport
-- >               The transport by which the goods are moved to the place
-- >               of acceptance.
-- >
-- >      28    Second on-carriage transport
-- >               Second transport by which the goods are moved after the
-- >               main carriage transport.
-- >
-- >      29    Main carriage - ninth carrier
-- >               The ninth carrier of the ordered transport.
-- >
-- >      30    On-carriage transport
-- >               Transport by which the goods are moved after the main
-- >               carriage transport.
-- >
-- >      31    Main carriage - tenth carrier
-- >               The tenth carrier of the ordered transport.
-- >
-- >      32    Main carriage - eleventh carrier
-- >               The eleventh carrier of the ordered transport.
-- >
-- >      33    Main carriage - twelfth carrier
-- >               The twelfth carrier of the ordered transport.
simple8051 :: Parser Value
simple8051 = simple "8051" (alphaNumeric `upTo` 3)
