{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.TOD
  ( -- * Definition
    segmentTOD
    -- * Dependencies
  , compositeC100
  , simple4055
  , simple4215
  ) where

import           Text.Edifact.D96A.Composites (compositeC100)
import           Text.Edifact.D96A.Simples    (simple4055, simple4215)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       TOD    TERMS OF DELIVERY OR TRANSPORT
-- >
-- >       Function: To specify terms of delivery or transport.
-- >
-- > 010   4055  TERMS OF DELIVERY OR TRANSPORT FUNCTION, CODED C  an..3
-- >
-- > 020   4215  TRANSPORT CHARGES METHOD OF PAYMENT, CODED     C  an..3
-- >
-- > 030   C100  TERMS OF DELIVERY OR TRANSPORT                 C
-- >       4053   Terms of delivery or transport, coded         C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       4052   Terms of delivery or transport                C  an..70
-- >       4052   Terms of delivery or transport                C  an..70
--
-- Dependencies: 'compositeC100', 'simple4055', 'simple4215'.
segmentTOD :: Parser Value
segmentTOD =
  segment "TOD"
    [ "010" .@ optional  simple4055
    , "020" .@ optional  simple4215
    , "030" .@ optional  compositeC100
    ]
