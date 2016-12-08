{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.QVR
  ( -- * Definition
    segmentQVR
    -- * Dependencies
  , compositeC279
  , compositeC960
  , simple4221
  ) where

import           Text.Edifact.D96A.Composites (compositeC279, compositeC960)
import           Text.Edifact.D96A.Simples    (simple4221)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       QVR    QUANTITY VARIANCES
-- >
-- >       Function: To specify item details relating to quantity
-- >                 variances.
-- >
-- >           Note: This segment replaces segment QVA (which has been
-- >                 deleted in this directory).
-- >
-- > 010   C279  QUANTITY DIFFERENCE INFORMATION                C
-- >       6064   Quantity difference                           M  n..15
-- >       6063   Quantity qualifier                            C  an..3
-- >
-- > 020   4221  DISCREPANCY, CODED                             C  an..3
-- >
-- > 030   C960  REASON FOR CHANGE                              C
-- >       4295   Change reason, coded                          C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       4294   Change reason                                 C  an..35
--
-- Dependencies: 'compositeC279', 'compositeC960', 'simple4221'.
segmentQVR :: Parser Value
segmentQVR =
  segment "QVR"
    [ "010" .@ optional  compositeC279
    , "020" .@ optional  simple4221
    , "030" .@ optional  compositeC960
    ]
