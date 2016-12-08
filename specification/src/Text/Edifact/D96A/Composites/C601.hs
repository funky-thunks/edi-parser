{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C601
  ( -- * Definition
    compositeC601
    -- * Dependencies
  , simple1131
  , simple3055
  , simple9015
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple9015)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C601  STATUS TYPE
-- >
-- >       Desc: To specify the type of status in relation to an industry
-- >             sector or business function.
-- >
-- > 010   9015   Status type, coded                            M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple9015'.
compositeC601 :: Parser Value
compositeC601 =
  composite "C601"
    [ "010" .@ mandatory simple9015
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
