{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C239
  ( -- * Definition
    compositeC239
    -- * Dependencies
  , simple6246
  , simple6411
  ) where

import           Text.Edifact.D96A.Simples (simple6246, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C239  TEMPERATURE SETTING
-- >
-- >       Desc: The temperature under which the goods are (to be) stored
-- >             or shipped.
-- >
-- > 010   6246   Temperature setting                           C  n3
-- > 020   6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'simple6246', 'simple6411'.
compositeC239 :: Parser Value
compositeC239 =
  composite "C239"
    [ "010" .@ optional  simple6246
    , "020" .@ optional  simple6411
    ]
