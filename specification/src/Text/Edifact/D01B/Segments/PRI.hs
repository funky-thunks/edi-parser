{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.PRI
  ( -- * Definition
    segmentPRI
    -- * Dependencies
  , compositeC509
  , simple5213
  ) where

import           Text.Edifact.D01B.Composites (compositeC509)
import           Text.Edifact.D01B.Simples    (simple5213)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        PRI  PRICE DETAILS
-- >
-- >        Function: To specify price information.
-- >
-- > 010    C509 PRICE INFORMATION                          C    1
-- >        5125  Price code qualifier                      M      an..3
-- >        5118  Price amount                              C      n..15
-- >        5375  Price type code                           C      an..3
-- >        5387  Price specification code                  C      an..3
-- >        5284  Unit price basis value                    C      n..9
-- >        6411  Measurement unit code                     C      an..3
-- >
-- > 020    5213 SUB-LINE ITEM PRICE CHANGE OPERATION CODE  C    1 an..3
--
-- Dependencies: 'compositeC509', 'simple5213'.
segmentPRI :: Parser Value
segmentPRI =
  segment "PRI"
    [ "010" .@ optional  compositeC509
    , "020" .@ optional  simple5213
    ]
