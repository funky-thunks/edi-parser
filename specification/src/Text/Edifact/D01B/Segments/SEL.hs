{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.SEL
  ( -- * Definition
    segmentSEL
    -- * Dependencies
  , compositeC208
  , compositeC215
  , simple4517
  , simple9308
  ) where

import           Text.Edifact.D01B.Composites (compositeC208, compositeC215)
import           Text.Edifact.D01B.Simples    (simple4517, simple9308)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        SEL  SEAL NUMBER
-- >
-- >        Function: To specify the seal number or a range of seal
-- >                  numbers.
-- >
-- > 010    9308 SEAL IDENTIFIER                            C    1 an..35
-- >
-- > 020    C215 SEAL ISSUER                                C    1
-- >        9303  Sealing party name code                   C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        9302  Sealing party name                        C      an..35
-- >
-- > 030    4517 SEAL CONDITION CODE                        C    1 an..3
-- >
-- > 040    C208 IDENTITY NUMBER RANGE                      C    1
-- >        7402  Object identifier                         M      an..35
-- >        7402  Object identifier                         C      an..35
--
-- Dependencies: 'compositeC208', 'compositeC215', 'simple4517', 'simple9308'.
segmentSEL :: Parser Value
segmentSEL =
  segment "SEL"
    [ "010" .@ optional  simple9308
    , "020" .@ optional  compositeC215
    , "030" .@ optional  simple4517
    , "040" .@ optional  compositeC208
    ]
