{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C239
  ( -- * Definition
    compositeC239
    -- * Dependencies
  , simple6246
  , simple6411
  ) where

import           Text.Edifact.D01B.Simples (simple6246, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C239 TEMPERATURE SETTING
-- >
-- >        Desc: The temperature under which the goods are (to be)
-- >              stored or shipped.
-- >
-- > 010    6246  Temperature value                         C      n..15
-- > 020    6411  Measurement unit code                     C      an..3
--
-- Dependencies: 'simple6246', 'simple6411'.
compositeC239 :: Parser Value
compositeC239 =
  composite "C239"
    [ "010" .@ optional  simple6246
    , "020" .@ optional  simple6411
    ]
