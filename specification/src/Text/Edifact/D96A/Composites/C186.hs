{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C186
  ( -- * Definition
    compositeC186
    -- * Dependencies
  , simple6060
  , simple6063
  , simple6411
  ) where

import           Text.Edifact.D96A.Simples (simple6060, simple6063, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C186  QUANTITY DETAILS
-- >
-- >       Desc: Quantity information in a transaction, qualified when
-- >             relevant.
-- >
-- > 010   6063   Quantity qualifier                            M  an..3
-- > 020   6060   Quantity                                      M  n..15
-- > 030   6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'simple6060', 'simple6063', 'simple6411'.
compositeC186 :: Parser Value
compositeC186 =
  composite "C186"
    [ "010" .@ mandatory simple6063
    , "020" .@ mandatory simple6060
    , "030" .@ optional  simple6411
    ]
