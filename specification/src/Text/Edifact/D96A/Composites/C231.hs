{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C231
  ( -- * Definition
    compositeC231
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4215
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple4215)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C231  METHOD OF PAYMENT
-- >
-- >       Desc: Code identifying the method of payment.
-- >
-- > 010   4215   Transport charges method of payment, coded    M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4215'.
compositeC231 :: Parser Value
compositeC231 =
  composite "C231"
    [ "010" .@ mandatory simple4215
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
