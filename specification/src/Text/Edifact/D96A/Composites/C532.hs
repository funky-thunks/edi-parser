{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C532
  ( -- * Definition
    compositeC532
    -- * Dependencies
  , simple8393
  , simple8395
  ) where

import           Text.Edifact.D96A.Simples (simple8393, simple8395)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C532  RETURNABLE PACKAGE DETAILS
-- >
-- >       Desc: Indication of responsibility for payment and load contents
-- >             of returnable packages.
-- >
-- > 010   8395   Returnable package freight payment            C  an..3
-- >              responsibility, coded
-- > 020   8393   Returnable package load contents, coded       C  an..3
--
-- Dependencies: 'simple8393', 'simple8395'.
compositeC532 :: Parser Value
compositeC532 =
  composite "C532"
    [ "010" .@ optional  simple8395
    , "020" .@ optional  simple8393
    ]
