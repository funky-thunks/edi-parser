{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.PCD
  ( -- * Definition
    segmentPCD
    -- * Dependencies
  , compositeC501
  , simple4405
  ) where

import           Text.Edifact.D01B.Composites (compositeC501)
import           Text.Edifact.D01B.Simples    (simple4405)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        PCD  PERCENTAGE DETAILS
-- >
-- >        Function: To specify percentage information.
-- >
-- > 010    C501 PERCENTAGE DETAILS                         M    1
-- >        5245  Percentage type code qualifier            M      an..3
-- >        5482  Percentage                                C      n..10
-- >        5249  Percentage basis identification code      C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 020    4405 STATUS DESCRIPTION CODE                    C    1 an..3
--
-- Dependencies: 'compositeC501', 'simple4405'.
segmentPCD :: Parser Value
segmentPCD =
  segment "PCD"
    [ "010" .@ mandatory compositeC501
    , "020" .@ optional  simple4405
    ]
