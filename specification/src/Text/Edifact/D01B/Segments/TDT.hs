{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TDT
  ( -- * Definition
    segmentTDT
    -- * Dependencies
  , compositeC040
  , compositeC220
  , compositeC222
  , compositeC228
  , compositeC401
  , simple8028
  , simple8051
  , simple8101
  , simple8281
  ) where

import           Text.Edifact.D01B.Composites (compositeC040, compositeC220,
                                               compositeC222, compositeC228,
                                               compositeC401)
import           Text.Edifact.D01B.Simples    (simple8028, simple8051,
                                               simple8101, simple8281)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TDT  DETAILS OF TRANSPORT
-- >
-- >        Function: To specify the transport details such as mode of
-- >                  transport, means of transport, its conveyance
-- >                  reference number and the identification of the
-- >                  means of transport.
-- >                  The segment may be pointed to by the TPL
-- >                  segment.
-- >
-- > 010    8051 TRANSPORT STAGE CODE QUALIFIER             M    1 an..3
-- >
-- > 020    8028 MEANS OF TRANSPORT JOURNEY IDENTIFIER      C    1 an..17
-- >
-- > 030    C220 MODE OF TRANSPORT                          C    1
-- >        8067  Transport mode name code                  C      an..3
-- >        8066  Transport mode name                       C      an..17
-- >
-- > 040    C228 TRANSPORT MEANS                            C    1
-- >        8179  Transport means description code          C      an..8
-- >        8178  Transport means description               C      an..17
-- >
-- > 050    C040 CARRIER                                    C    1
-- >        3127  Carrier identifier                        C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3128  Carrier name                              C      an..35
-- >
-- > 060    8101 TRANSIT DIRECTION INDICATOR CODE           C    1 an..3
-- >
-- > 070    C401 EXCESS TRANSPORTATION INFORMATION          C    1
-- >        8457  Excess transportation reason code         M      an..3
-- >        8459  Excess transportation responsibility code M      an..3
-- >        7130  Customer shipment authorisation
-- >              identifier                                C      an..17
-- >
-- > 080    C222 TRANSPORT IDENTIFICATION                   C    1
-- >        8213  Transport means identification name
-- >              identifier                                C      an..9
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        8212  Transport means identification name       C      an..35
-- >        8453  Transport means nationality code          C      an..3
-- >
-- > 090    8281 TRANSPORT MEANS OWNERSHIP INDICATOR CODE   C    1 an..3
--
-- Dependencies: 'compositeC040', 'compositeC220', 'compositeC222', 'compositeC228', 'compositeC401', 'simple8028', 'simple8051', 'simple8101', 'simple8281'.
segmentTDT :: Parser Value
segmentTDT =
  segment "TDT"
    [ "010" .@ mandatory simple8051
    , "020" .@ optional  simple8028
    , "030" .@ optional  compositeC220
    , "040" .@ optional  compositeC228
    , "050" .@ optional  compositeC040
    , "060" .@ optional  simple8101
    , "070" .@ optional  compositeC401
    , "080" .@ optional  compositeC222
    , "090" .@ optional  simple8281
    ]
