{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.DLM
  ( -- * Definition
    segmentDLM
    -- * Dependencies
  , compositeC214
  , compositeC522
  , simple4455
  , simple4457
  ) where

import           Text.Edifact.D96A.Composites (compositeC214, compositeC522)
import           Text.Edifact.D96A.Simples    (simple4455, simple4457)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       DLM    DELIVERY LIMITATIONS
-- >
-- >       Function: To specify limitations on deliveries.
-- >
-- > 010   4455  BACK ORDER, CODED                              C  an..3
-- >
-- > 020   C522  INSTRUCTION                                    C
-- >       4403   Instruction qualifier                         M  an..3
-- >       4401   Instruction, coded                            C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       4400   Instruction                                   C  an..35
-- >
-- > 030   C214  SPECIAL SERVICES IDENTIFICATION                C
-- >       7161   Special services, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7160   Special service                               C  an..35
-- >       7160   Special service                               C  an..35
-- >
-- > 040   4457  PRODUCT/SERVICE SUBSTITUTION, CODED            C  an..3
--
-- Dependencies: 'compositeC214', 'compositeC522', 'simple4455', 'simple4457'.
segmentDLM :: Parser Value
segmentDLM =
  segment "DLM"
    [ "010" .@ optional  simple4455
    , "020" .@ optional  compositeC522
    , "030" .@ optional  compositeC214
    , "040" .@ optional  simple4457
    ]
