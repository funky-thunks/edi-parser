{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C040
  ( -- * Definition
    compositeC040
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3127
  , simple3128
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple3127,
                                            simple3128)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C040  CARRIER
-- >
-- >       Desc: Identification of a carrier by code and/or by name. Code
-- >             preferred.
-- >
-- > 010   3127   Carrier identification                        C  an..17
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   3128   Carrier name                                  C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3127', 'simple3128'.
compositeC040 :: Parser Value
compositeC040 =
  composite "C040"
    [ "010" .@ optional  simple3127
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3128
    ]
