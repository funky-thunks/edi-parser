{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.ALI
  ( -- * Definition
    segmentALI
    -- * Dependencies
  , simple3239
  , simple4183
  , simple9213
  ) where

import           Text.Edifact.D96A.Simples (simple3239, simple4183, simple9213)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       ALI    ADDITIONAL INFORMATION
-- >
-- >       Function: To indicate that special conditions due to the origin,
-- >                 customs preference, fiscal or commercial factors are
-- >                 applicable.
-- >
-- > 010   3239  COUNTRY OF ORIGIN, CODED                       C  an..3
-- >
-- > 020   9213  TYPE OF DUTY REGIME, CODED                     C  an..3
-- >
-- > 030   4183  SPECIAL CONDITIONS, CODED                      C  an..3
-- >
-- > 040   4183  SPECIAL CONDITIONS, CODED                      C  an..3
-- >
-- > 050   4183  SPECIAL CONDITIONS, CODED                      C  an..3
-- >
-- > 060   4183  SPECIAL CONDITIONS, CODED                      C  an..3
-- >
-- > 070   4183  SPECIAL CONDITIONS, CODED                      C  an..3
--
-- Dependencies: 'simple3239', 'simple4183', 'simple9213'.
segmentALI :: Parser Value
segmentALI =
  segment "ALI"
    [ "010" .@ optional  simple3239
    , "020" .@ optional  simple9213
    , "030" .@ optional  simple4183
    , "040" .@ optional  simple4183
    , "050" .@ optional  simple4183
    , "060" .@ optional  simple4183
    , "070" .@ optional  simple4183
    ]
