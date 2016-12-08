{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.PAC
  ( -- * Definition
    segmentPAC
    -- * Dependencies
  , compositeC202
  , compositeC402
  , compositeC531
  , compositeC532
  , simple7224
  ) where

import           Text.Edifact.D96A.Composites (compositeC202, compositeC402,
                                               compositeC531, compositeC532)
import           Text.Edifact.D96A.Simples    (simple7224)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       PAC    PACKAGE
-- >
-- >       Function: To describe the number and type of packages/physical
-- >                 units.
-- >
-- > 010   7224  NUMBER OF PACKAGES                             C  n..8
-- >
-- > 020   C531  PACKAGING DETAILS                              C
-- >       7075   Packaging level, coded                        C  an..3
-- >       7233   Packaging related information, coded          C  an..3
-- >       7073   Packaging terms and conditions, coded         C  an..3
-- >
-- > 030   C202  PACKAGE TYPE                                   C
-- >       7065   Type of packages identification               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7064   Type of packages                              C  an..35
-- >
-- > 040   C402  PACKAGE TYPE IDENTIFICATION                    C
-- >       7077   Item description type, coded                  M  an..3
-- >       7064   Type of packages                              M  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       7064   Type of packages                              C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >
-- > 050   C532  RETURNABLE PACKAGE DETAILS                     C
-- >       8395   Returnable package freight payment            C  an..3
-- >              responsibility, coded
-- >       8393   Returnable package load contents, coded       C  an..3
--
-- Dependencies: 'compositeC202', 'compositeC402', 'compositeC531', 'compositeC532', 'simple7224'.
segmentPAC :: Parser Value
segmentPAC =
  segment "PAC"
    [ "010" .@ optional  simple7224
    , "020" .@ optional  compositeC531
    , "030" .@ optional  compositeC202
    , "040" .@ optional  compositeC402
    , "050" .@ optional  compositeC532
    ]
