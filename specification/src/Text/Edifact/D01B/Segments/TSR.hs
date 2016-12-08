{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TSR
  ( -- * Definition
    segmentTSR
    -- * Dependencies
  , compositeC233
  , compositeC536
  , compositeC537
  , compositeC703
  ) where

import           Text.Edifact.D01B.Composites (compositeC233, compositeC536,
                                               compositeC537, compositeC703)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TSR  TRANSPORT SERVICE REQUIREMENTS
-- >
-- >        Function: To specify the contract and carriage conditions
-- >                  and service and priority requirements for the
-- >                  transport.
-- >
-- > 010    C536 CONTRACT AND CARRIAGE CONDITION            C    1
-- >        4065  Contract and carriage condition code      M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 020    C233 SERVICE                                    C    1
-- >        7273  Service requirement code                  M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7273  Service requirement code                  C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 030    C537 TRANSPORT PRIORITY                         C    1
-- >        4219  Transport service priority code           M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 040    C703 NATURE OF CARGO                            C    1
-- >        7085  Cargo type classification code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'compositeC233', 'compositeC536', 'compositeC537', 'compositeC703'.
segmentTSR :: Parser Value
segmentTSR =
  segment "TSR"
    [ "010" .@ optional  compositeC536
    , "020" .@ optional  compositeC233
    , "030" .@ optional  compositeC537
    , "040" .@ optional  compositeC703
    ]
