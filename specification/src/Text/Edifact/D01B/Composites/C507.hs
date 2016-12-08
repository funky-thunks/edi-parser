{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C507
  ( -- * Definition
    compositeC507
    -- * Dependencies
  , simple2005
  , simple2379
  , simple2380
  ) where

import           Text.Edifact.D01B.Simples (simple2005, simple2379, simple2380)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C507 DATE/TIME/PERIOD
-- >
-- >        Desc: Date and/or time, or period relevant to the
-- >              specified date/time/period type.
-- >
-- > 010    2005  Date or time or period function code
-- >              qualifier                                 M      an..3
-- > 020    2380  Date or time or period value              C      an..35
-- > 030    2379  Date or time or period format code        C      an..3
--
-- Dependencies: 'simple2005', 'simple2379', 'simple2380'.
compositeC507 :: Parser Value
compositeC507 =
  composite "C507"
    [ "010" .@ mandatory simple2005
    , "020" .@ optional  simple2380
    , "030" .@ optional  simple2379
    ]
