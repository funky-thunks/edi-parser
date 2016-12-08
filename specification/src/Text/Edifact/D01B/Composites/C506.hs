{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C506
  ( -- * Definition
    compositeC506
    -- * Dependencies
  , simple1060
  , simple1153
  , simple1154
  , simple1156
  , simple4000
  ) where

import           Text.Edifact.D01B.Simples (simple1060, simple1153, simple1154,
                                            simple1156, simple4000)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C506 REFERENCE
-- >
-- >        Desc: Identification of a reference.
-- >
-- > 010    1153  Reference code qualifier                  M      an..3
-- > 020    1154  Reference identifier                      C      an..70
-- > 030    1156  Document line identifier                  C      an..6
-- > 040    4000  Reference version identifier              C      an..35
-- > 050    1060  Revision identifier                       C      an..6
--
-- Dependencies: 'simple1060', 'simple1153', 'simple1154', 'simple1156', 'simple4000'.
compositeC506 :: Parser Value
compositeC506 =
  composite "C506"
    [ "010" .@ mandatory simple1153
    , "020" .@ optional  simple1154
    , "030" .@ optional  simple1156
    , "040" .@ optional  simple4000
    , "050" .@ optional  simple1060
    ]
