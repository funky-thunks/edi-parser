{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C270
  ( -- * Definition
    compositeC270
    -- * Dependencies
  , simple6066
  , simple6069
  , simple6411
  ) where

import           Text.Edifact.D96A.Simples (simple6066, simple6069, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C270  CONTROL
-- >
-- >       Desc: Control total for checking integrity of a message or part
-- >             of a message.
-- >
-- > 010   6069   Control qualifier                             M  an..3
-- > 020   6066   Control value                                 M  n..18
-- > 030   6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'simple6066', 'simple6069', 'simple6411'.
compositeC270 :: Parser Value
compositeC270 =
  composite "C270"
    [ "010" .@ mandatory simple6069
    , "020" .@ mandatory simple6066
    , "030" .@ optional  simple6411
    ]
