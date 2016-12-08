{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.HAN
  ( -- * Definition
    segmentHAN
    -- * Dependencies
  , compositeC218
  , compositeC524
  ) where

import           Text.Edifact.D01B.Composites (compositeC218, compositeC524)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        HAN  HANDLING INSTRUCTIONS
-- >
-- >        Function: To specify handling and where necessary, notify
-- >                  hazards.
-- >
-- > 010    C524 HANDLING INSTRUCTIONS                      C    1
-- >        4079  Handling instruction description code     C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        4078  Handling instruction description          C      an..70
-- >
-- > 020    C218 HAZARDOUS MATERIAL                         C    1
-- >        7419  Hazardous material category name code     C      an..7
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7418  Hazardous material category name          C      an..35
--
-- Dependencies: 'compositeC218', 'compositeC524'.
segmentHAN :: Parser Value
segmentHAN =
  segment "HAN"
    [ "010" .@ optional  compositeC524
    , "020" .@ optional  compositeC218
    ]
