{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.PRI
  ( -- * Definition
    segmentPRI
    -- * Dependencies
  , compositeC509
  , simple5213
  ) where

import           Text.Edifact.D96A.Composites (compositeC509)
import           Text.Edifact.D96A.Simples    (simple5213)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       PRI    PRICE DETAILS
-- >
-- >       Function: To specify price information.
-- >
-- > 010   C509  PRICE INFORMATION                              C
-- >       5125   Price qualifier                               M  an..3
-- >       5118   Price                                         C  n..15
-- >       5375   Price type, coded                             C  an..3
-- >       5387   Price type qualifier                          C  an..3
-- >       5284   Unit price basis                              C  n..9
-- >       6411   Measure unit qualifier                        C  an..3
-- >
-- > 020   5213  SUB-LINE PRICE CHANGE, CODED                   C  an..3
--
-- Dependencies: 'compositeC509', 'simple5213'.
segmentPRI :: Parser Value
segmentPRI =
  segment "PRI"
    [ "010" .@ optional  compositeC509
    , "020" .@ optional  simple5213
    ]
