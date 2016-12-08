{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Common.Segments.UNT
  ( segmentUNT
  ) where

import           Text.Edifact.Common.Simples (simple0062, simple0074)

import           Text.Edifact.Parsing
import           Text.Edifact.Types          (Value)

-- | Derived from this specification:
--
-- >         Change indicators
-- >
-- >           UNT    MESSAGE TRAILER
-- >
-- >           Function: To end and check the completeness of a message.
-- >
-- >     010   0074  NUMBER OF SEGMENTS IN THE MESSAGE                     M  n..6
-- >
-- >     020   0062  MESSAGE REFERENCE NUMBER                              M  an..14
--
-- Dependencies: 'simple0062', 'simple0074'.
segmentUNT :: Parser Value
segmentUNT =
  segment "UNT"
    [ "010" .@ mandatory simple0074
    , "020" .@ mandatory simple0062
    ]
