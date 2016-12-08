{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.COM
  ( -- * Definition
    segmentCOM
    -- * Dependencies
  , compositeC076
  ) where

import           Text.Edifact.D01B.Composites (compositeC076)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        COM  COMMUNICATION CONTACT
-- >
-- >        Function: To identify a communication number of a
-- >                  department or a person to whom communication
-- >                  should be directed.
-- >
-- > 010    C076 COMMUNICATION CONTACT                      M    3
-- >        3148  Communication address identifier          M      an..512
-- >        3155  Communication address code qualifier      M      an..3
--
-- Dependencies: 'compositeC076'.
segmentCOM :: Parser Value
segmentCOM =
  segment "COM"
    [ "010" .@ mandatory compositeC076
    ]
