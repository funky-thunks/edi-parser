{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C703
  ( -- * Definition
    compositeC703
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7085
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7085)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C703  NATURE OF CARGO
-- >
-- >       Desc: Rough classification of a type of cargo.
-- >
-- > 010   7085   Nature of cargo, coded                        M  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7085'.
compositeC703 :: Parser Value
compositeC703 =
  composite "C703"
    [ "010" .@ mandatory simple7085
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
