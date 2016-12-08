{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C206
  ( -- * Definition
    compositeC206
    -- * Dependencies
  , simple4405
  , simple7402
  , simple7405
  ) where

import           Text.Edifact.D96A.Simples (simple4405, simple7402, simple7405)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C206  IDENTIFICATION NUMBER
-- >
-- >       Desc: The identification of an object.
-- >
-- > 010   7402   Identity number                               M  an..35
-- > 020   7405   Identity number qualifier                     C  an..3
-- > 030   4405   Status, coded                                 C  an..3
--
-- Dependencies: 'simple4405', 'simple7402', 'simple7405'.
compositeC206 :: Parser Value
compositeC206 =
  composite "C206"
    [ "010" .@ mandatory simple7402
    , "020" .@ optional  simple7405
    , "030" .@ optional  simple4405
    ]
