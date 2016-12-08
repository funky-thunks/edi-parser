{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C202
  ( -- * Definition
    compositeC202
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7064
  , simple7065
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7064,
                                            simple7065)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C202  PACKAGE TYPE
-- >
-- >       Desc: Type of package by name or by code from a specified
-- >             source.
-- >
-- > 010   7065   Type of packages identification               C  an..17
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   7064   Type of packages                              C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7064', 'simple7065'.
compositeC202 :: Parser Value
compositeC202 =
  composite "C202"
    [ "010" .@ optional  simple7065
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple7064
    ]
