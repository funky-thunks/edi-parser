{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C402
  ( -- * Definition
    compositeC402
    -- * Dependencies
  , simple7064
  , simple7077
  , simple7143
  ) where

import           Text.Edifact.D96A.Simples (simple7064, simple7077, simple7143)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C402  PACKAGE TYPE IDENTIFICATION
-- >
-- >       Desc: Identification of the form in which goods are described.
-- >
-- > 010   7077   Item description type, coded                  M  an..3
-- > 020   7064   Type of packages                              M  an..35
-- > 030   7143   Item number type, coded                       C  an..3
-- > 040   7064   Type of packages                              C  an..35
-- > 050   7143   Item number type, coded                       C  an..3
--
-- Dependencies: 'simple7064', 'simple7077', 'simple7143'.
compositeC402 :: Parser Value
compositeC402 =
  composite "C402"
    [ "010" .@ mandatory simple7077
    , "020" .@ mandatory simple7064
    , "030" .@ optional  simple7143
    , "040" .@ optional  simple7064
    , "050" .@ optional  simple7143
    ]
