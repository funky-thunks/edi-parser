{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C519
  ( -- * Definition
    compositeC519
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3222
  , simple3223
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple3222,
                                            simple3223)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C519  RELATED LOCATION ONE IDENTIFICATION
-- >
-- >       Desc: Identification the first related location by code or name.
-- >
-- > 010   3223   Related place/location one identification     C  an..25
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   3222   Related place/location one                    C  an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3222', 'simple3223'.
compositeC519 :: Parser Value
compositeC519 =
  composite "C519"
    [ "010" .@ optional  simple3223
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3222
    ]
