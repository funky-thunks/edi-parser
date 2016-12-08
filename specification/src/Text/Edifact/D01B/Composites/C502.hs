{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C502
  ( -- * Definition
    compositeC502
    -- * Dependencies
  , simple6154
  , simple6155
  , simple6313
  , simple6321
  ) where

import           Text.Edifact.D01B.Simples (simple6154, simple6155, simple6313,
                                            simple6321)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C502 MEASUREMENT DETAILS
-- >
-- >        Desc: Identification of measurement type.
-- >
-- > 010    6313  Measured attribute code                   C      an..3
-- > 020    6321  Measurement significance code             C      an..3
-- > 030    6155  Non-discrete measurement name code        C      an..17
-- > 040    6154  Non-discrete measurement name             C      an..70
--
-- Dependencies: 'simple6154', 'simple6155', 'simple6313', 'simple6321'.
compositeC502 :: Parser Value
compositeC502 =
  composite "C502"
    [ "010" .@ optional  simple6313
    , "020" .@ optional  simple6321
    , "030" .@ optional  simple6155
    , "040" .@ optional  simple6154
    ]
