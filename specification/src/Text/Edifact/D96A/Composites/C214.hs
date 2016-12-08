{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C214
  ( -- * Definition
    compositeC214
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7160
  , simple7161
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7160,
                                            simple7161)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >     * C214  SPECIAL SERVICES IDENTIFICATION
-- >
-- >       Desc: Identification of a special service by a code from a
-- >             specified source or by description.
-- >
-- > 010   7161   Special services, coded                       C  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   7160   Special service                               C  an..35
-- > 050 + 7160   Special service                               C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7160', 'simple7161'.
compositeC214 :: Parser Value
compositeC214 =
  composite "C214"
    [ "010" .@ optional  simple7161
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple7160
    , "050" .@ optional  simple7160
    ]
