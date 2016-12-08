{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TMP
  ( -- * Definition
    segmentTMP
    -- * Dependencies
  , compositeC239
  , simple6245
  ) where

import           Text.Edifact.D01B.Composites (compositeC239)
import           Text.Edifact.D01B.Simples    (simple6245)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TMP  TEMPERATURE
-- >
-- >        Function: To specify the temperature setting.
-- >
-- > 010    6245 TEMPERATURE TYPE CODE QUALIFIER            M    1 an..3
-- >
-- > 020    C239 TEMPERATURE SETTING                        C    1
-- >        6246  Temperature value                         C      n..15
-- >        6411  Measurement unit code                     C      an..3
--
-- Dependencies: 'compositeC239', 'simple6245'.
segmentTMP :: Parser Value
segmentTMP =
  segment "TMP"
    [ "010" .@ mandatory simple6245
    , "020" .@ optional  compositeC239
    ]
