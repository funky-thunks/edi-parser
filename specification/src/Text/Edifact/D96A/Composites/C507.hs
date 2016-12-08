{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C507
  ( -- * Definition
    compositeC507
    -- * Dependencies
  , simple2005
  , simple2379
  , simple2380
  ) where

import           Text.Edifact.D96A.Simples (simple2005, simple2379, simple2380)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C507  DATE/TIME/PERIOD
-- >
-- >       Desc: Date and/or time, or period relevant to the specified
-- >             date/time/period type.
-- >
-- > 010   2005   Date/time/period qualifier                    M  an..3
-- > 020   2380   Date/time/period                              C  an..35
-- > 030   2379   Date/time/period format qualifier             C  an..3
--
-- Dependencies: 'simple2005', 'simple2379', 'simple2380'.
compositeC507 :: Parser Value
compositeC507 =
  composite "C507"
    [ "010" .@ mandatory simple2005
    , "020" .@ optional  simple2380
    , "030" .@ optional  simple2379
    ]
