{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.IMD
  ( -- * Definition
    segmentIMD
    -- * Dependencies
  , compositeC273
  , simple7077
  , simple7081
  , simple7383
  ) where

import           Text.Edifact.D96A.Composites (compositeC273)
import           Text.Edifact.D96A.Simples    (simple7077, simple7081,
                                               simple7383)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       IMD    ITEM DESCRIPTION
-- >
-- >       Function: To describe an item in either an industry or free
-- >                 format.
-- >
-- > 010   7077  ITEM DESCRIPTION TYPE, CODED                   C  an..3
-- >
-- > 020   7081  ITEM CHARACTERISTIC, CODED                     C  an..3
-- >
-- > 030   C273  ITEM DESCRIPTION                               C
-- >       7009   Item description identification               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7008   Item description                              C  an..35
-- >       7008   Item description                              C  an..35
-- >       3453   Language, coded                               C  an..3
-- >
-- > 040   7383  SURFACE/LAYER INDICATOR, CODED                 C  an..3
--
-- Dependencies: 'compositeC273', 'simple7077', 'simple7081', 'simple7383'.
segmentIMD :: Parser Value
segmentIMD =
  segment "IMD"
    [ "010" .@ optional  simple7077
    , "020" .@ optional  simple7081
    , "030" .@ optional  compositeC273
    , "040" .@ optional  simple7383
    ]
