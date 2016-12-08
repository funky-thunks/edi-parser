{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.TCC
  ( -- * Definition
    segmentTCC
    -- * Dependencies
  , compositeC200
  , compositeC203
  , compositeC528
  , compositeC554
  ) where

import           Text.Edifact.D96A.Composites (compositeC200, compositeC203,
                                               compositeC528, compositeC554)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       TCC    TRANSPORT CHARGE/RATE CALCULATIONS
-- >
-- >       Function: To specify charges.
-- >
-- > 010   C200  CHARGE                                         C
-- >       8023   Freight and charges identification            C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       8022   Freight and charges                           C  an..26
-- >       4237   Prepaid/collect indicator, coded              C  an..3
-- >       7140   Item number                                   C  an..35
-- >
-- > 020   C203  RATE/TARIFF CLASS                              C
-- >       5243   Rate/tariff class identification              M  an..9
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       5242   Rate/tariff class                             C  an..35
-- >       5275   Supplementary rate/tariff basis               C  an..6
-- >              identification
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       5275   Supplementary rate/tariff basis               C  an..6
-- >              identification
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 030   C528  COMMODITY/RATE DETAIL                          C
-- >       7357   Commodity/rate identification                 C  an..18
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 040   C554  RATE/TARIFF CLASS DETAIL                       C
-- >       5243   Rate/tariff class identification              C  an..9
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'compositeC200', 'compositeC203', 'compositeC528', 'compositeC554'.
segmentTCC :: Parser Value
segmentTCC =
  segment "TCC"
    [ "010" .@ optional  compositeC200
    , "020" .@ optional  compositeC203
    , "030" .@ optional  compositeC528
    , "040" .@ optional  compositeC554
    ]
