{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TCC
  ( -- * Definition
    segmentTCC
    -- * Dependencies
  , compositeC200
  , compositeC203
  , compositeC528
  , compositeC554
  ) where

import           Text.Edifact.D01B.Composites (compositeC200, compositeC203,
                                               compositeC528, compositeC554)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TCC  CHARGE/RATE CALCULATIONS
-- >
-- >        Function: To specify charges.
-- >
-- > 010    C200 CHARGE                                     C    1
-- >        8023  Freight and other charges description
-- >              identifier                                C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        8022  Freight and other charges description     C      an..26
-- >        4237  Payment arrangement code                  C      an..3
-- >        7140  Item identifier                           C      an..35
-- >
-- > 020    C203 RATE/TARIFF CLASS                          C    1
-- >        5243  Rate or tariff class description code     M      an..9
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        5242  Rate or tariff class description          C      an..35
-- >        5275  Supplementary rate or tariff code         C      an..6
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        5275  Supplementary rate or tariff code         C      an..6
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 030    C528 COMMODITY/RATE DETAIL                      C    1
-- >        7357  Commodity identification code             C      an..18
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 040    C554 RATE/TARIFF CLASS DETAIL                   C    1
-- >        5243  Rate or tariff class description code     C      an..9
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
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
