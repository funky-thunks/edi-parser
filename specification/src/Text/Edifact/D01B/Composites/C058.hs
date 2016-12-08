{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C058
  ( -- * Definition
    compositeC058
    -- * Dependencies
  , simple3124
  ) where

import           Text.Edifact.D01B.Simples (simple3124)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C058 NAME AND ADDRESS
-- >
-- >        Desc: Unstructured name and address: one to five lines.
-- >
-- > 010    3124  Name and address description              M      an..35
-- > 020    3124  Name and address description              C      an..35
-- > 030    3124  Name and address description              C      an..35
-- > 040    3124  Name and address description              C      an..35
-- > 050    3124  Name and address description              C      an..35
--
-- Dependencies: 'simple3124'.
compositeC058 :: Parser Value
compositeC058 =
  composite "C058"
    [ "010" .@ mandatory simple3124
    , "020" .@ optional  simple3124
    , "030" .@ optional  simple3124
    , "040" .@ optional  simple3124
    , "050" .@ optional  simple3124
    ]
