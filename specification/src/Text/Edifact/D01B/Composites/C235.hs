{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C235
  ( -- * Definition
    compositeC235
    -- * Dependencies
  , simple8158
  , simple8186
  ) where

import           Text.Edifact.D01B.Simples (simple8158, simple8186)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C235 HAZARD IDENTIFICATION PLACARD DETAILS
-- >
-- >        Desc: These numbers appear on the hazard identification
-- >              placard required on the means of transport.
-- >
-- > 010    8158  Orange hazard placard upper part
-- >              identifier                                C      an..4
-- > 020    8186  Orange hazard placard lower part
-- >              identifier                                C      an4
--
-- Dependencies: 'simple8158', 'simple8186'.
compositeC235 :: Parser Value
compositeC235 =
  composite "C235"
    [ "010" .@ optional  simple8158
    , "020" .@ optional  simple8186
    ]
