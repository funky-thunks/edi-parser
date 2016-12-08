{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.LOC
  ( -- * Definition
    segmentLOC
    -- * Dependencies
  , compositeC517
  , compositeC519
  , compositeC553
  , simple3227
  , simple5479
  ) where

import           Text.Edifact.D01B.Composites (compositeC517, compositeC519,
                                               compositeC553)
import           Text.Edifact.D01B.Simples    (simple3227, simple5479)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        LOC  PLACE/LOCATION IDENTIFICATION
-- >
-- >        Function: To identify a place or a location and/or related
-- >                  locations.
-- >
-- > 010    3227 LOCATION FUNCTION CODE QUALIFIER           M    1 an..3
-- >
-- > 020    C517 LOCATION IDENTIFICATION                    C    1
-- >        3225  Location name code                        C      an..25
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3224  Location name                             C      an..256
-- >
-- > 030    C519 RELATED LOCATION ONE IDENTIFICATION        C    1
-- >        3223  First related location name code          C      an..25
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3222  First related location name               C      an..70
-- >
-- > 040    C553 RELATED LOCATION TWO IDENTIFICATION        C    1
-- >        3233  Second related location name code         C      an..25
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3232  Second related location name              C      an..70
-- >
-- > 050    5479 RELATION CODE                              C    1 an..3
--
-- Dependencies: 'compositeC517', 'compositeC519', 'compositeC553', 'simple3227', 'simple5479'.
segmentLOC :: Parser Value
segmentLOC =
  segment "LOC"
    [ "010" .@ mandatory simple3227
    , "020" .@ optional  compositeC517
    , "030" .@ optional  compositeC519
    , "040" .@ optional  compositeC553
    , "050" .@ optional  simple5479
    ]
