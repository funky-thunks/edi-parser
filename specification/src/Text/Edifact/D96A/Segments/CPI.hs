{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.CPI
  ( -- * Definition
    segmentCPI
    -- * Dependencies
  , compositeC229
  , compositeC231
  , simple4237
  ) where

import           Text.Edifact.D96A.Composites (compositeC229, compositeC231)
import           Text.Edifact.D96A.Simples    (simple4237)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       CPI    CHARGE PAYMENT INSTRUCTIONS
-- >
-- >       Function: To identify a charge.
-- >
-- > 010   C229  CHARGE CATEGORY                                C
-- >       5237   Charge category, coded                        M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 020   C231  METHOD OF PAYMENT                              C
-- >       4215   Transport charges method of payment, coded    M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 030   4237  PREPAID/COLLECT INDICATOR, CODED               C  an..3
--
-- Dependencies: 'compositeC229', 'compositeC231', 'simple4237'.
segmentCPI :: Parser Value
segmentCPI =
  segment "CPI"
    [ "010" .@ optional  compositeC229
    , "020" .@ optional  compositeC231
    , "030" .@ optional  simple4237
    ]
