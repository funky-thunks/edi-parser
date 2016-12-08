{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C506
  ( -- * Definition
    compositeC506
    -- * Dependencies
  , simple1153
  , simple1154
  , simple1156
  , simple4000
  ) where

import           Text.Edifact.D96A.Simples (simple1153, simple1154, simple1156,
                                            simple4000)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C506  REFERENCE
-- >
-- >       Desc: Identification of a reference.
-- >
-- > 010   1153   Reference qualifier                           M  an..3
-- > 020   1154   Reference number                              C  an..35
-- > 030   1156   Line number                                   C  an..6
-- > 040   4000   Reference version number                      C  an..35
--
-- Dependencies: 'simple1153', 'simple1154', 'simple1156', 'simple4000'.
compositeC506 :: Parser Value
compositeC506 =
  composite "C506"
    [ "010" .@ mandatory simple1153
    , "020" .@ optional  simple1154
    , "030" .@ optional  simple1156
    , "040" .@ optional  simple4000
    ]
