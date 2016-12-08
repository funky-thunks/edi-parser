{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.HAN
  ( -- * Definition
    segmentHAN
    -- * Dependencies
  , compositeC218
  , compositeC524
  ) where

import           Text.Edifact.D96A.Composites (compositeC218, compositeC524)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       HAN    HANDLING INSTRUCTIONS
-- >
-- >       Function: To specify handling and where necessary, notify
-- >                 hazards.
-- >
-- > 010   C524  HANDLING INSTRUCTIONS                          C
-- >       4079   Handling instructions, coded                  C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       4078   Handling instructions                         C  an..70
-- >
-- > 020   C218  HAZARDOUS MATERIAL                             C
-- >       7419   Hazardous material class code, identification C  an..4
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'compositeC218', 'compositeC524'.
segmentHAN :: Parser Value
segmentHAN =
  segment "HAN"
    [ "010" .@ optional  compositeC524
    , "020" .@ optional  compositeC218
    ]
