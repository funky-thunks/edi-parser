{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.TMP
  ( -- * Definition
    segmentTMP
    -- * Dependencies
  , compositeC239
  , simple6245
  ) where

import           Text.Edifact.D96A.Composites (compositeC239)
import           Text.Edifact.D96A.Simples    (simple6245)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       TMP    TEMPERATURE
-- >
-- >       Function: To specify the temperature setting.
-- >
-- > 010   6245  TEMPERATURE QUALIFIER                          M  an..3
-- >
-- > 020   C239  TEMPERATURE SETTING                            C
-- >       6246   Temperature setting                           C  n3
-- >       6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'compositeC239', 'simple6245'.
segmentTMP :: Parser Value
segmentTMP =
  segment "TMP"
    [ "010" .@ mandatory simple6245
    , "020" .@ optional  compositeC239
    ]
