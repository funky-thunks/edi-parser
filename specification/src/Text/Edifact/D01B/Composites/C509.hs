{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C509
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

import           Text.Edifact.D01B.Simples (simple5118, simple5125, simple5284,
                                            simple5375, simple5387, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C509 PRICE INFORMATION
-- >
-- >        Desc: Identification of price type, price and related
-- >              details.
-- >
-- > 010    5125  Price code qualifier                      M      an..3
-- > 020    5118  Price amount                              C      n..15
-- > 030    5375  Price type code                           C      an..3
-- > 040    5387  Price specification code                  C      an..3
-- > 050    5284  Unit price basis value                    C      n..9
-- > 060    6411  Measurement unit code                     C      an..3
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
