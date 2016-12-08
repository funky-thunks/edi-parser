{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.LIN
  ( -- * Definition
    segmentLIN
    -- * Dependencies
  , compositeC212
  , compositeC829
  , simple1082
  , simple1222
  , simple1229
  , simple7083
  ) where

import           Text.Edifact.D96A.Composites (compositeC212, compositeC829)
import           Text.Edifact.D96A.Simples    (simple1082, simple1222,
                                               simple1229, simple7083)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       LIN    LINE ITEM
-- >
-- >       Function: To identify a line item and configuration.
-- >
-- > 010   1082  LINE ITEM NUMBER                               C  n..6
-- >
-- > 020   1229  ACTION REQUEST/NOTIFICATION, CODED             C  an..3
-- >
-- > 030   C212  ITEM NUMBER IDENTIFICATION                     C
-- >       7140   Item number                                   C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 040   C829  SUB-LINE INFORMATION                           C
-- >       5495   Sub-line indicator, coded                     C  an..3
-- >       1082   Line item number                              C  n..6
-- >
-- > 050   1222  CONFIGURATION LEVEL                            C  n..2
-- >
-- > 060   7083  CONFIGURATION, CODED                           C  an..3
--
-- Dependencies: 'compositeC212', 'compositeC829', 'simple1082', 'simple1222', 'simple1229', 'simple7083'.
segmentLIN :: Parser Value
segmentLIN =
  segment "LIN"
    [ "010" .@ optional  simple1082
    , "020" .@ optional  simple1229
    , "030" .@ optional  compositeC212
    , "040" .@ optional  compositeC829
    , "050" .@ optional  simple1222
    , "060" .@ optional  simple7083
    ]
