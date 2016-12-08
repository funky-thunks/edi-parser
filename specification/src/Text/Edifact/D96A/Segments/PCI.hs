{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.PCI
  ( -- * Definition
    segmentPCI
    -- * Dependencies
  , compositeC210
  , compositeC827
  , simple4233
  , simple8275
  ) where

import           Text.Edifact.D96A.Composites (compositeC210, compositeC827)
import           Text.Edifact.D96A.Simples    (simple4233, simple8275)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       PCI    PACKAGE IDENTIFICATION
-- >
-- >       Function: To specify markings and labels on individual packages
-- >                 or physical units.
-- >
-- > 010   4233  MARKING INSTRUCTIONS, CODED                    C  an..3
-- >
-- > 020   C210  MARKS & LABELS                                 C
-- >       7102   Shipping marks                                M  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >       7102   Shipping marks                                C  an..35
-- >
-- > 030   8275  CONTAINER/PACKAGE STATUS, CODED                C  an..3
-- >
-- > 040   C827  TYPE OF MARKING                                C
-- >       7511   Type of marking, coded                        M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
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
