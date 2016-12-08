{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.ICD
  ( -- * Definition
    segmentICD
    -- * Dependencies
  , compositeC330
  , compositeC331
  ) where

import           Text.Edifact.D01B.Composites (compositeC330, compositeC331)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        ICD  INSURANCE COVER DESCRIPTION
-- >
-- >        Function: To describe the insurance cover.
-- >
-- > 010    C330 INSURANCE COVER TYPE                       M    1
-- >        4497  Insurance cover type code                 M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 020    C331 INSURANCE COVER DETAILS                    M    1
-- >        4495  Insurance cover description code          C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        4494  Insurance cover description               C      an..35
-- >        4494  Insurance cover description               C      an..35
--
-- Dependencies: 'compositeC330', 'compositeC331'.
segmentICD :: Parser Value
segmentICD =
  segment "ICD"
    [ "010" .@ mandatory compositeC330
    , "020" .@ mandatory compositeC331
    ]
