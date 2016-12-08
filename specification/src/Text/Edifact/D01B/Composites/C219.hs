{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C219
  ( -- * Definition
    compositeC219
    -- * Dependencies
  , simple8334
  , simple8335
  ) where

import           Text.Edifact.D01B.Simples (simple8334, simple8335)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C219 MOVEMENT TYPE
-- >
-- >        Desc: Description of type of service for movement of
-- >              cargo.
-- >
-- > 010    8335  Movement type description code            C      an..3
-- > 020    8334  Movement type description                 C      an..35
--
-- Dependencies: 'simple8334', 'simple8335'.
compositeC219 :: Parser Value
compositeC219 =
  composite "C219"
    [ "010" .@ optional  simple8335
    , "020" .@ optional  simple8334
    ]
