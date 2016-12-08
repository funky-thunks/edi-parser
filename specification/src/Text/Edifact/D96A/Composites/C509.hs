{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C509
  ( -- * Definition
    compositeC509
    -- * Dependencies
  , simple5118
  , simple5125
  , simple5284
  , simple5375
  , simple5387
  , simple6411
  ) where

import           Text.Edifact.D96A.Simples (simple5118, simple5125, simple5284,
                                            simple5375, simple5387, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C509  PRICE INFORMATION
-- >
-- >       Desc: Identification of price type, price and related details.
-- >
-- > 010   5125   Price qualifier                               M  an..3
-- > 020   5118   Price                                         C  n..15
-- > 030   5375   Price type, coded                             C  an..3
-- > 040   5387   Price type qualifier                          C  an..3
-- > 050   5284   Unit price basis                              C  n..9
-- > 060   6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'simple5118', 'simple5125', 'simple5284', 'simple5375', 'simple5387', 'simple6411'.
compositeC509 :: Parser Value
compositeC509 =
  composite "C509"
    [ "010" .@ mandatory simple5125
    , "020" .@ optional  simple5118
    , "030" .@ optional  simple5375
    , "040" .@ optional  simple5387
    , "050" .@ optional  simple5284
    , "060" .@ optional  simple6411
    ]
