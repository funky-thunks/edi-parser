{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C960
  ( -- * Definition
    compositeC960
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4294
  , simple4295
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple4294,
                                            simple4295)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C960  REASON FOR CHANGE
-- >
-- >       Desc: Code and/or description of the reason for a change.
-- >
-- >       Note: This composite data element replaces composite C262 (which
-- >             has been deleted in this directory).
-- >
-- > 010   4295   Change reason, coded                          C  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   4294   Change reason                                 C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4294', 'simple4295'.
compositeC960 :: Parser Value
compositeC960 =
  composite "C960"
    [ "010" .@ optional  simple4295
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple4294
    ]
