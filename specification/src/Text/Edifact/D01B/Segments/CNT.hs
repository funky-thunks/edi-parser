{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.CNT
  ( -- * Definition
    segmentCNT
    -- * Dependencies
  , compositeC270
  ) where

import           Text.Edifact.D01B.Composites (compositeC270)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        CNT  CONTROL TOTAL
-- >
-- >        Function: To provide control total.
-- >
-- > 010    C270 CONTROL                                    M    1
-- >        6069  Control total type code qualifier         M      an..3
-- >        6066  Control total value                       M      n..18
-- >        6411  Measurement unit code                     C      an..3
--
-- Dependencies: 'compositeC270'.
segmentCNT :: Parser Value
segmentCNT =
  segment "CNT"
    [ "010" .@ mandatory compositeC270
    ]
