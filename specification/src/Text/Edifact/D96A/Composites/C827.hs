{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C827
  ( -- * Definition
    compositeC827
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7511
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7511)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C827  TYPE OF MARKING
-- >
-- >       Desc: Specification of the type of marking that reflects the
-- >             method that was used and the conventions adhered to for
-- >             marking (e.g. of packages).
-- >
-- > 010   7511   Type of marking, coded                        M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7511'.
compositeC827 :: Parser Value
compositeC827 =
  composite "C827"
    [ "010" .@ mandatory simple7511
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
