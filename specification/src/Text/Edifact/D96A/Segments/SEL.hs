{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.SEL
  ( -- * Definition
    segmentSEL
    -- * Dependencies
  , compositeC215
  , simple4517
  , simple9308
  ) where

import           Text.Edifact.D96A.Composites (compositeC215)
import           Text.Edifact.D96A.Simples    (simple4517, simple9308)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       SEL    SEAL NUMBER
-- >
-- >       Function: To specify a seal number related to equipment.
-- >
-- > 010   9308  SEAL NUMBER                                    M  an..10
-- >
-- > 020   C215  SEAL ISSUER                                    C
-- >       9303   Sealing party, coded                          C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9302   Sealing party                                 C  an..35
-- >
-- > 030   4517  SEAL CONDITION, CODED                          C  an..3
--
-- Dependencies: 'compositeC215', 'simple4517', 'simple9308'.
segmentSEL :: Parser Value
segmentSEL =
  segment "SEL"
    [ "010" .@ mandatory simple9308
    , "020" .@ optional  compositeC215
    , "030" .@ optional  simple4517
    ]
