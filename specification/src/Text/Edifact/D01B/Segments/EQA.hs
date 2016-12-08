{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.EQA
  ( -- * Definition
    segmentEQA
    -- * Dependencies
  , compositeC237
  , simple8053
  ) where

import           Text.Edifact.D01B.Composites (compositeC237)
import           Text.Edifact.D01B.Simples    (simple8053)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        EQA  ATTACHED EQUIPMENT
-- >
-- >        Function: To specify attached or related equipment.
-- >
-- > 010    8053 EQUIPMENT TYPE CODE QUALIFIER              M    1 an..3
-- >
-- > 020    C237 EQUIPMENT IDENTIFICATION                   C    1
-- >        8260  Equipment identifier                      C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3207  Country name code                         C      an..3
--
-- Dependencies: 'compositeC237', 'simple8053'.
segmentEQA :: Parser Value
segmentEQA =
  segment "EQA"
    [ "010" .@ mandatory simple8053
    , "020" .@ optional  compositeC237
    ]
