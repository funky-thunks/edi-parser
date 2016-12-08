{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C555
  ( -- * Definition
    compositeC555
    -- * Dependencies
  , simple1131
  , simple3055
  , simple9010
  , simple9011
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple9010,
                                            simple9011)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C555  STATUS EVENT
-- >
-- >       Desc: To specify a status event.
-- >
-- > 010   9011   Status event, coded                           M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   9010   Status event                                  C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple9010', 'simple9011'.
compositeC555 :: Parser Value
compositeC555 =
  composite "C555"
    [ "010" .@ mandatory simple9011
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple9010
    ]
