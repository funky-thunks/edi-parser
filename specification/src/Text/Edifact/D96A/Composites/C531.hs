{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C531
  ( -- * Definition
    compositeC531
    -- * Dependencies
  , simple7073
  , simple7075
  , simple7233
  ) where

import           Text.Edifact.D96A.Simples (simple7073, simple7075, simple7233)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C531  PACKAGING DETAILS
-- >
-- >       Desc: Packaging level and details, terms and conditions.
-- >
-- > 010   7075   Packaging level, coded                        C  an..3
-- > 020   7233   Packaging related information, coded          C  an..3
-- > 030   7073   Packaging terms and conditions, coded         C  an..3
--
-- Dependencies: 'simple7073', 'simple7075', 'simple7233'.
compositeC531 :: Parser Value
compositeC531 =
  composite "C531"
    [ "010" .@ optional  simple7075
    , "020" .@ optional  simple7233
    , "030" .@ optional  simple7073
    ]
