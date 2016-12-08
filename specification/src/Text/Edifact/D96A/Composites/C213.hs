{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C213
  ( -- * Definition
    compositeC213
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7064
  , simple7065
  , simple7224
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7064,
                                            simple7065, simple7224)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C213  NUMBER AND TYPE OF PACKAGES
-- >
-- >       Desc: Number and type of individual parts of a shipment.
-- >
-- > 010   7224   Number of packages                            C  n..8
-- > 020   7065   Type of packages identification               C  an..17
-- > 030   1131   Code list qualifier                           C  an..3
-- > 040   3055   Code list responsible agency, coded           C  an..3
-- > 050   7064   Type of packages                              C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7064', 'simple7065', 'simple7224'.
compositeC213 :: Parser Value
compositeC213 =
  composite "C213"
    [ "010" .@ optional  simple7224
    , "020" .@ optional  simple7065
    , "030" .@ optional  simple1131
    , "040" .@ optional  simple3055
    , "050" .@ optional  simple7064
    ]
