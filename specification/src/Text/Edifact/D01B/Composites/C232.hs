{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C232
  ( -- * Definition
    compositeC232
    -- * Dependencies
  , simple9353
  , simple9411
  , simple9415
  , simple9417
  ) where

import           Text.Edifact.D01B.Simples (simple9353, simple9411, simple9415,
                                            simple9417)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C232 GOVERNMENT ACTION
-- >
-- >        Desc: Code indicating a type of government action.
-- >
-- > 010    9415  Government agency identification code     C      an..3
-- > 020    9411  Government involvement code               C      an..3
-- > 030    9417  Government action code                    C      an..3
-- > 040    9353  Government procedure code                 C      an..3
--
-- Dependencies: 'simple9353', 'simple9411', 'simple9415', 'simple9417'.
compositeC232 :: Parser Value
compositeC232 =
  composite "C232"
    [ "010" .@ optional  simple9415
    , "020" .@ optional  simple9411
    , "030" .@ optional  simple9417
    , "040" .@ optional  simple9353
    ]
