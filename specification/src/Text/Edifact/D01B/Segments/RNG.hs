{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.RNG
  ( -- * Definition
    segmentRNG
    -- * Dependencies
  , compositeC280
  , simple6167
  ) where

import           Text.Edifact.D01B.Composites (compositeC280)
import           Text.Edifact.D01B.Simples    (simple6167)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        RNG  RANGE DETAILS
-- >
-- >        Function: To identify a range.
-- >
-- > 010    6167 RANGE TYPE CODE QUALIFIER                  M    1 an..3
-- >
-- > 020    C280 RANGE                                      C    1
-- >        6411  Measurement unit code                     M      an..3
-- >        6162  Range minimum value                       C      n..18
-- >        6152  Range maximum value                       C      n..18
--
-- Dependencies: 'compositeC280', 'simple6167'.
segmentRNG :: Parser Value
segmentRNG =
  segment "RNG"
    [ "010" .@ mandatory simple6167
    , "020" .@ optional  compositeC280
    ]
