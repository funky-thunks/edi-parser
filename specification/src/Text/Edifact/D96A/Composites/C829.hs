{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C829
  ( -- * Definition
    compositeC829
    -- * Dependencies
  , simple1082
  , simple5495
  ) where

import           Text.Edifact.D96A.Simples (simple1082, simple5495)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C829  SUB-LINE INFORMATION
-- >
-- >       Desc: To provide an indication that a segment or segment group
-- >             is used to contain sub-line or sub-line item information
-- >             and to optionally enable the sub-line to be identified.
-- >
-- > 010   5495   Sub-line indicator, coded                     C  an..3
-- > 020   1082   Line item number                              C  n..6
--
-- Dependencies: 'simple1082', 'simple5495'.
compositeC829 :: Parser Value
compositeC829 =
  composite "C829"
    [ "010" .@ optional  simple5495
    , "020" .@ optional  simple1082
    ]
