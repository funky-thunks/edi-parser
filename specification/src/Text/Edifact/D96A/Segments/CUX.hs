{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.CUX
  ( -- * Definition
    segmentCUX
    -- * Dependencies
  , compositeC504
  , simple5402
  , simple6341
  ) where

import           Text.Edifact.D96A.Composites (compositeC504)
import           Text.Edifact.D96A.Simples    (simple5402, simple6341)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       CUX    CURRENCIES
-- >
-- >       Function: To specify currencies used in the transaction and
-- >                 relevant details for the rate of exchange.
-- >
-- > 010   C504  CURRENCY DETAILS                               C
-- >       6347   Currency details qualifier                    M  an..3
-- >       6345   Currency, coded                               C  an..3
-- >       6343   Currency qualifier                            C  an..3
-- >       6348   Currency rate base                            C  n..4
-- >
-- > 020   C504  CURRENCY DETAILS                               C
-- >       6347   Currency details qualifier                    M  an..3
-- >       6345   Currency, coded                               C  an..3
-- >       6343   Currency qualifier                            C  an..3
-- >       6348   Currency rate base                            C  n..4
-- >
-- > 030   5402  RATE OF EXCHANGE                               C  n..12
-- >
-- > 040   6341  CURRENCY MARKET EXCHANGE, CODED                C  an..3
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
