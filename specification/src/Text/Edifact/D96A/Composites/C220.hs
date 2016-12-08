{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C220
  ( -- * Definition
    compositeC220
    -- * Dependencies
  , simple8066
  , simple8067
  ) where

import           Text.Edifact.D96A.Simples (simple8066, simple8067)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C220  MODE OF TRANSPORT
-- >
-- >       Desc: Method of transport code or name. Code preferred.
-- >
-- > 010   8067   Mode of transport, coded                      C  an..3
-- > 020   8066   Mode of transport                             C  an..17
--
-- Dependencies: 'simple8066', 'simple8067'.
compositeC220 :: Parser Value
compositeC220 =
  composite "C220"
    [ "010" .@ optional  simple8067
    , "020" .@ optional  simple8066
    ]
