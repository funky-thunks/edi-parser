{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C555
  ( -- * Definition
    compositeC555
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4404
  , simple4405
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4404,
                                            simple4405)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C555 STATUS
-- >
-- >        Desc: To specify a status.
-- >
-- > 010    4405  Status description code                   M      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    4404  Status description                        C      an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4404', 'simple4405'.
compositeC555 :: Parser Value
compositeC555 =
  composite "C555"
    [ "010" .@ mandatory simple4405
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple4404
    ]
