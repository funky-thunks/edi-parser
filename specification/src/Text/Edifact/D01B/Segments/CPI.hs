{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.CPI
  ( -- * Definition
    segmentCPI
    -- * Dependencies
  , compositeC229
  , compositeC231
  , simple4237
  ) where

import           Text.Edifact.D01B.Composites (compositeC229, compositeC231)
import           Text.Edifact.D01B.Simples    (simple4237)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        CPI  CHARGE PAYMENT INSTRUCTIONS
-- >
-- >        Function: To identify a charge.
-- >
-- > 010    C229 CHARGE CATEGORY                            C    1
-- >        5237  Charge category code                      M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 020    C231 METHOD OF PAYMENT                          C    1
-- >        4215  Transport charges payment method code     M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 030    4237 PAYMENT ARRANGEMENT CODE                   C    1 an..3
--
-- Dependencies: 'compositeC229', 'compositeC231', 'simple4237'.
segmentCPI :: Parser Value
segmentCPI =
  segment "CPI"
    [ "010" .@ optional  compositeC229
    , "020" .@ optional  compositeC231
    , "030" .@ optional  simple4237
    ]
