{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C523
  ( -- * Definition
    compositeC523
    -- * Dependencies
  , simple6350
  , simple6353
  ) where

import           Text.Edifact.D96A.Simples (simple6350, simple6353)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C523  NUMBER OF UNIT DETAILS
-- >
-- >       Desc: Identification of number of units and its purpose.
-- >
-- > 010   6350   Number of units                               C  n..15
-- > 020   6353   Number of units qualifier                     C  an..3
--
-- Dependencies: 'simple6350', 'simple6353'.
compositeC523 :: Parser Value
compositeC523 =
  composite "C523"
    [ "010" .@ optional  simple6350
    , "020" .@ optional  simple6353
    ]
