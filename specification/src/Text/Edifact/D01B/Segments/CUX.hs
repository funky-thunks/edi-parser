{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.CUX
  ( -- * Definition
    segmentCUX
    -- * Dependencies
  , compositeC504
  , simple5402
  , simple6341
  ) where

import           Text.Edifact.D01B.Composites (compositeC504)
import           Text.Edifact.D01B.Simples    (simple5402, simple6341)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        CUX  CURRENCIES
-- >
-- >        Function: To specify currencies used in the transaction
-- >                  and relevant details for the rate of exchange.
-- >
-- > 010    C504 CURRENCY DETAILS                           C    1
-- >        6347  Currency usage code qualifier             M      an..3
-- >        6345  Currency identification code              C      an..3
-- >        6343  Currency type code qualifier              C      an..3
-- >        6348  Currency rate value                       C      n..4
-- >
-- > 020    C504 CURRENCY DETAILS                           C    1
-- >        6347  Currency usage code qualifier             M      an..3
-- >        6345  Currency identification code              C      an..3
-- >        6343  Currency type code qualifier              C      an..3
-- >        6348  Currency rate value                       C      n..4
-- >
-- > 030    5402 CURRENCY EXCHANGE RATE                     C    1 n..12
-- >
-- > 040    6341 EXCHANGE RATE CURRENCY MARKET IDENTIFIER   C    1 an..3
--
-- Dependencies: 'compositeC504', 'simple5402', 'simple6341'.
segmentCUX :: Parser Value
segmentCUX =
  segment "CUX"
    [ "010" .@ optional  compositeC504
    , "020" .@ optional  compositeC504
    , "030" .@ optional  simple5402
    , "040" .@ optional  simple6341
    ]
