{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Common.Segments.UNS
  ( segmentUNS
  ) where

import           Text.Edifact.Common.Simples (simple0081)

import           Text.Edifact.Parsing
import           Text.Edifact.Types          (Value)

-- | Derived from this specification:
--
-- >         Change indicators
-- >
-- >           UNS    SECTION CONTROL
-- >
-- >           Function: To separate Header, Detail and Summary sections of a message
-- >
-- >     010   0081  SECTION IDENTIFICATION                                M  a1
--
-- Dependencies: 'simple0081'.
segmentUNS :: Parser Value
segmentUNS =
  segment "UNS"
    [ "010" .@ mandatory simple0081
    ]
