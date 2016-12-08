{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.CNT
  ( -- * Definition
    segmentCNT
    -- * Dependencies
  , compositeC270
  ) where

import           Text.Edifact.D96A.Composites (compositeC270)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       CNT    CONTROL TOTAL
-- >
-- >       Function: To provide control total.
-- >
-- > 010   C270  CONTROL                                        M
-- >       6069   Control qualifier                             M  an..3
-- >       6066   Control value                                 M  n..18
-- >       6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'compositeC270'.
segmentCNT :: Parser Value
segmentCNT =
  segment "CNT"
    [ "010" .@ mandatory compositeC270
    ]
