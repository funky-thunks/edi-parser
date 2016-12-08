{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C220
  ( -- * Definition
    compositeC220
    -- * Dependencies
  , simple8066
  , simple8067
  ) where

import           Text.Edifact.D01B.Simples (simple8066, simple8067)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C220 MODE OF TRANSPORT
-- >
-- >        Desc: Method of transport code or name. Code preferred.
-- >
-- > 010    8067  Transport mode name code                  C      an..3
-- > 020    8066  Transport mode name                       C      an..17
--
-- Dependencies: 'simple8066', 'simple8067'.
compositeC220 :: Parser Value
compositeC220 =
  composite "C220"
    [ "010" .@ optional  simple8067
    , "020" .@ optional  simple8066
    ]
