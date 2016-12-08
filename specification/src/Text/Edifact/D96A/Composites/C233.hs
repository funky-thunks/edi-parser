{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C233
  ( -- * Definition
    compositeC233
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7273
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7273)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >     | C233  SERVICE
-- >
-- >     | Desc: To identify a service (which may constitute an additional
-- >             component to a basic contract).
-- >
-- > 010   7273   Service requirement, coded                    M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   7273   Service requirement, coded                    C  an..3
-- > 050   1131   Code list qualifier                           C  an..3
-- > 060   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7273'.
compositeC233 :: Parser Value
compositeC233 =
  composite "C233"
    [ "010" .@ mandatory simple7273
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple7273
    , "050" .@ optional  simple1131
    , "060" .@ optional  simple3055
    ]
