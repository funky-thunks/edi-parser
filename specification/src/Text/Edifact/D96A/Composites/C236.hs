{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C236
  ( -- * Definition
    compositeC236
    -- * Dependencies
  , simple8246
  ) where

import           Text.Edifact.D96A.Simples (simple8246)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C236  DANGEROUS GOODS LABEL
-- >
-- >       Desc: Markings identifying the type of hazardous goods and
-- >             similar information.
-- >
-- > 010   8246   Dangerous goods label marking                 C  an..4
-- > 020   8246   Dangerous goods label marking                 C  an..4
-- > 030   8246   Dangerous goods label marking                 C  an..4
--
-- Dependencies: 'simple8246'.
compositeC236 :: Parser Value
compositeC236 =
  composite "C236"
    [ "010" .@ optional  simple8246
    , "020" .@ optional  simple8246
    , "030" .@ optional  simple8246
    ]
