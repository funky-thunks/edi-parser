{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.PIA
  ( -- * Definition
    segmentPIA
    -- * Dependencies
  , compositeC212
  , simple4347
  ) where

import           Text.Edifact.D96A.Composites (compositeC212)
import           Text.Edifact.D96A.Simples    (simple4347)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       PIA    ADDITIONAL PRODUCT ID
-- >
-- >       Function: To specify additional or substitutional item
-- >                 identification codes.
-- >
-- > 010   4347  PRODUCT ID. FUNCTION QUALIFIER                 M  an..3
-- >
-- > 020   C212  ITEM NUMBER IDENTIFICATION                     M
-- >       7140   Item number                                   C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 030   C212  ITEM NUMBER IDENTIFICATION                     C
-- >       7140   Item number                                   C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 040   C212  ITEM NUMBER IDENTIFICATION                     C
-- >       7140   Item number                                   C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 050   C212  ITEM NUMBER IDENTIFICATION                     C
-- >       7140   Item number                                   C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 060   C212  ITEM NUMBER IDENTIFICATION                     C
-- >       7140   Item number                                   C  an..35
-- >       7143   Item number type, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'compositeC212', 'simple4347'.
segmentPIA :: Parser Value
segmentPIA =
  segment "PIA"
    [ "010" .@ mandatory simple4347
    , "020" .@ mandatory compositeC212
    , "030" .@ optional  compositeC212
    , "040" .@ optional  compositeC212
    , "050" .@ optional  compositeC212
    , "060" .@ optional  compositeC212
    ]
