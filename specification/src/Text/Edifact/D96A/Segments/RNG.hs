{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.RNG
  ( -- * Definition
    segmentRNG
    -- * Dependencies
  , compositeC280
  , simple6167
  ) where

import           Text.Edifact.D96A.Composites (compositeC280)
import           Text.Edifact.D96A.Simples    (simple6167)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       RNG    RANGE DETAILS
-- >
-- >       Function: To identify a range.
-- >
-- > 010   6167  RANGE TYPE QUALIFIER                           M  an..3
-- >
-- > 020   C280  RANGE                                          C
-- >       6411   Measure unit qualifier                        M  an..3
-- >       6162   Range minimum                                 C  n..18
-- >       6152   Range maximum                                 C  n..18
--
-- Dependencies: 'compositeC280', 'simple6167'.
segmentRNG :: Parser Value
segmentRNG =
  segment "RNG"
    [ "010" .@ mandatory simple6167
    , "020" .@ optional  compositeC280
    ]
