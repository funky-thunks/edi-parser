{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C228
  ( -- * Definition
    compositeC228
    -- * Dependencies
  , simple8178
  , simple8179
  ) where

import           Text.Edifact.D96A.Simples (simple8178, simple8179)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C228  TRANSPORT MEANS
-- >
-- >       Desc: Code and/or name identifying the type of means of
-- >             transport.
-- >
-- > 010   8179   Type of means of transport identification     C  an..8
-- > 020   8178   Type of means of transport                    C  an..17
--
-- Dependencies: 'simple8178', 'simple8179'.
compositeC228 :: Parser Value
compositeC228 =
  composite "C228"
    [ "010" .@ optional  simple8179
    , "020" .@ optional  simple8178
    ]
