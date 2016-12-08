{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.PCI
  ( -- * Definition
    segmentPCI
    -- * Dependencies
  , compositeC210
  , compositeC827
  , simple4233
  , simple8275
  ) where

import           Text.Edifact.D01B.Composites (compositeC210, compositeC827)
import           Text.Edifact.D01B.Simples    (simple4233, simple8275)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        PCI  PACKAGE IDENTIFICATION
-- >
-- >        Function: To specify markings and labels on individual
-- >                  packages or physical units.
-- >
-- > 010    4233 MARKING INSTRUCTIONS CODE                  C    1 an..3
-- >
-- > 020    C210 MARKS & LABELS                             C    1
-- >        7102  Shipping marks description                M      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >        7102  Shipping marks description                C      an..35
-- >
-- > 030    8275 CONTAINER OR PACKAGE CONTENTS INDICATOR
-- >             CODE                                       C    1 an..3
-- >
-- > 040    C827 TYPE OF MARKING                            C    1
-- >        7511  Marking type code                         M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'compositeC210', 'compositeC827', 'simple4233', 'simple8275'.
segmentPCI :: Parser Value
segmentPCI =
  segment "PCI"
    [ "010" .@ optional  simple4233
    , "020" .@ optional  compositeC210
    , "030" .@ optional  simple8275
    , "040" .@ optional  compositeC827
    ]
