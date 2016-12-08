{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.SGP
  ( -- * Definition
    segmentSGP
    -- * Dependencies
  , compositeC237
  , simple7224
  ) where

import           Text.Edifact.D01B.Composites (compositeC237)
import           Text.Edifact.D01B.Simples    (simple7224)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        SGP  SPLIT GOODS PLACEMENT
-- >
-- >        Function: To specify the placement of goods in relation to
-- >                  equipment.
-- >
-- > 010    C237 EQUIPMENT IDENTIFICATION                   M    1
-- >        8260  Equipment identifier                      C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3207  Country name code                         C      an..3
-- >
-- > 020    7224 PACKAGE QUANTITY                           C    1 n..8
--
-- Dependencies: 'compositeC237', 'simple7224'.
segmentSGP :: Parser Value
segmentSGP =
  segment "SGP"
    [ "010" .@ mandatory compositeC237
    , "020" .@ optional  simple7224
    ]
