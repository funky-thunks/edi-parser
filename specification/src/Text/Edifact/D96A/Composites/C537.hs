{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C537
  ( -- * Definition
    compositeC537
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4219
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple4219)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C537  TRANSPORT PRIORITY
-- >
-- >       Desc: To indicate the priority of requested transport service.
-- >
-- > 010   4219   Transport priority, coded                     M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4219'.
compositeC537 :: Parser Value
compositeC537 =
  composite "C537"
    [ "010" .@ mandatory simple4219
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
