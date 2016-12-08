{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.MEA
  ( -- * Definition
    segmentMEA
    -- * Dependencies
  , compositeC174
  , compositeC502
  , simple6311
  , simple7383
  ) where

import           Text.Edifact.D01B.Composites (compositeC174, compositeC502)
import           Text.Edifact.D01B.Simples    (simple6311, simple7383)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        MEA  MEASUREMENTS
-- >
-- >        Function: To specify physical measurements, including
-- >                  dimension tolerances, weights and counts.
-- >
-- > 010    6311 MEASUREMENT PURPOSE CODE QUALIFIER         M    1 an..3
-- >
-- > 020    C502 MEASUREMENT DETAILS                        C    1
-- >        6313  Measured attribute code                   C      an..3
-- >        6321  Measurement significance code             C      an..3
-- >        6155  Non-discrete measurement name code        C      an..17
-- >        6154  Non-discrete measurement name             C      an..70
-- >
-- > 030    C174 VALUE/RANGE                                C    1
-- >        6411  Measurement unit code                     M      an..3
-- >        6314  Measurement value                         C      an..18
-- >        6162  Range minimum value                       C      n..18
-- >        6152  Range maximum value                       C      n..18
-- >        6432  Significant digits quantity               C      n..2
-- >
-- > 040    7383 SURFACE OR LAYER CODE                      C    1 an..3
--
-- Dependencies: 'compositeC174', 'compositeC502', 'simple6311', 'simple7383'.
segmentMEA :: Parser Value
segmentMEA =
  segment "MEA"
    [ "010" .@ mandatory simple6311
    , "020" .@ optional  compositeC502
    , "030" .@ optional  compositeC174
    , "040" .@ optional  simple7383
    ]
