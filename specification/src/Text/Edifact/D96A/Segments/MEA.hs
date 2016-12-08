{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.MEA
  ( -- * Definition
    segmentMEA
    -- * Dependencies
  , compositeC174
  , compositeC502
  , simple6311
  , simple7383
  ) where

import           Text.Edifact.D96A.Composites (compositeC174, compositeC502)
import           Text.Edifact.D96A.Simples    (simple6311, simple7383)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       MEA    MEASUREMENTS
-- >
-- >       Function: To specify physical measurements, including dimension
-- >                 tolerances, weights and counts.
-- >
-- > 010   6311  MEASUREMENT APPLICATION QUALIFIER              M  an..3
-- >
-- > 020   C502  MEASUREMENT DETAILS                            C
-- >       6313   Measurement dimension, coded                  C  an..3
-- >       6321   Measurement significance, coded               C  an..3
-- >       6155   Measurement attribute, coded                  C  an..3
-- >       6154   Measurement attribute                         C  an..70
-- >
-- > 030   C174  VALUE/RANGE                                    C
-- >       6411   Measure unit qualifier                        M  an..3
-- >       6314   Measurement value                             C  n..18
-- >       6162   Range minimum                                 C  n..18
-- >       6152   Range maximum                                 C  n..18
-- >       6432   Significant digits                            C  n..2
-- >
-- > 040   7383  SURFACE/LAYER INDICATOR, CODED                 C  an..3
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
