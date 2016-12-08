{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C556
  ( -- * Definition
    compositeC556
    -- * Dependencies
  , simple1131
  , simple3055
  , simple9012
  , simple9013
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple9012,
                                            simple9013)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C556  STATUS REASON
-- >
-- >       Desc: To specify the reason behind a status event.
-- >
-- > 010   9013   Status reason, coded                          M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   9012   Status reason                                 C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple9012', 'simple9013'.
compositeC556 :: Parser Value
compositeC556 =
  composite "C556"
    [ "010" .@ mandatory simple9013
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple9012
    ]
