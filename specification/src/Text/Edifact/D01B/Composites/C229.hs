{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C229
  ( -- * Definition
    compositeC229
    -- * Dependencies
  , simple1131
  , simple3055
  , simple5237
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple5237)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C229 CHARGE CATEGORY
-- >
-- >        Desc: Identification of a category or a zone of charges.
-- >
-- > 010    5237  Charge category code                      M      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple5237'.
compositeC229 :: Parser Value
compositeC229 =
  composite "C229"
    [ "010" .@ mandatory simple5237
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
