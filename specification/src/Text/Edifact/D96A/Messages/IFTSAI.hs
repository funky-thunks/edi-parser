{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Messages.IFTSAI
  ( -- * Definition
    messageIFTSAI
    -- * Dependencies
  , segmentBGM
  , segmentCOM
  , segmentCTA
  , segmentDGS
  , segmentDIM
  , segmentDTM
  , segmentEQD
  , segmentEQN
  , segmentFTX
  , segmentGDS
  , segmentGID
  , segmentHAN
  , segmentLOC
  , segmentMEA
  , segmentNAD
  , segmentQTY
  , segmentRFF
  , segmentTDT
  , segmentTSR
  ) where

import           Text.Edifact.Common.Segments

import           Text.Edifact.D96A.Segments   (segmentBGM, segmentCOM,
                                               segmentCTA, segmentDGS,
                                               segmentDIM, segmentDTM,
                                               segmentEQD, segmentEQN,
                                               segmentFTX, segmentGDS,
                                               segmentGID, segmentHAN,
                                               segmentLOC, segmentMEA,
                                               segmentNAD, segmentQTY,
                                               segmentRFF, segmentTDT,
                                               segmentTSR)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- > 4.3    Message structure
-- >
-- > 4.3.1  Segment table
-- >
-- > Pos    Tag Name                                      S   R
-- >
-- > 0010   UNH Message header                            M   1
-- > 0020   BGM Beginning of message                      M   1
-- > 0030   DTM Date/time/period                          C   9
-- > 0040   FTX Free text                                 C   99
-- >
-- > 0050 +     ----- Segment group 1  ------------------ C   9-----------+
-- > 0060 * RFF Reference                                 M   1           |
-- > 0070 + DTM Date/time/period                          C   9-----------+
-- >
-- > 0080       ----- Segment group 2  ------------------ C   9-----------+
-- > 0090   LOC Place/location identification             M   1           |
-- > 0100   DTM Date/time/period                          C   9-----------+
-- >
-- > 0110       ----- Segment group 3  ------------------ C   9-----------+
-- > 0120   EQD Equipment details                         M   1           |
-- > 0130   EQN Number of units                           C   9           |
-- > 0140   MEA Measurements                              C   9           |
-- > 0150   DIM Dimensions                                C   9           |
-- > 0160   FTX Free text                                 C   9-----------+
-- >
-- > 0170       ----- Segment group 4  ------------------ C   999---------+
-- > 0180   TDT Details of transport                      M   1           |
-- > 0190   DTM Date/time/period                          C   9           |
-- > 0200   TSR Transport service requirements            C   9           |
-- > 0210   FTX Free text                                 C   9           |
-- > 0220   EQD Equipment details                         C   99          |
-- > 0230   QTY Quantity                                  C   9           |
-- > 0240   MEA Measurements                              C   9           |
-- >                                                                      |
-- > 0250       ----- Segment group 5  ------------------ C   99---------+|
-- > 0260   LOC Place/location identification             M   1          ||
-- > 0270   DTM Date/time/period                          C   9----------++
-- >
-- > 0280       ----- Segment group 6  ------------------ C   9-----------+
-- > 0290   NAD Name and address                          M   1           |
-- > 0300   LOC Place/location identification             C   9           |
-- >                                                                      |
-- > 0310       ----- Segment group 7  ------------------ C   9----------+|
-- > 0320   CTA Contact information                       M   1          ||
-- > 0330   COM Communication contact                     C   9----------++
-- >
-- > 0340       ----- Segment group 8  ------------------ C   9-----------+
-- > 0350   GID Goods item details                        M   1           |
-- > 0360   HAN Handling instructions                     C   9           |
-- > 0370   FTX Free text                                 C   9           |
-- >                                                                      |
-- > 0380       ----- Segment group 9  ------------------ C   9----------+|
-- > 0390   GDS Nature of cargo                           M   1          ||
-- > 0400   FTX Free text                                 C   9----------+|
-- >                                                                      |
-- > 0410       ----- Segment group 10 ------------------ C   9----------+|
-- > 0420   MEA Measurements                              M   1          ||
-- > 0430   EQN Number of units                           C   9----------+|
-- >                                                                      |
-- > 0440       ----- Segment group 11 ------------------ C   9----------+|
-- > 0450   DIM Dimensions                                M   1          ||
-- > 0460   EQN Number of units                           C   9----------+|
-- >                                                                      |
-- > 0470       ----- Segment group 12 ------------------ C   9----------+|
-- > 0480   DGS Dangerous goods                           M   1          ||
-- > 0490   FTX Free text                                 C   9----------++
-- > 0500   UNT Message trailer                           M   1
--
-- Dependencies: 'segmentBGM', 'segmentCOM', 'segmentCTA', 'segmentDGS', 'segmentDIM', 'segmentDTM', 'segmentEQD', 'segmentEQN', 'segmentFTX', 'segmentGDS', 'segmentGID', 'segmentHAN', 'segmentLOC', 'segmentMEA', 'segmentNAD', 'segmentQTY', 'segmentRFF', 'segmentTDT', 'segmentTSR'.
messageIFTSAI :: Parser Value
messageIFTSAI =
  message "IFTSAI"
    [ "0010" .@ once segmentUNH
    , "0020" .@ once segmentBGM
    , "0030" .@ repeated 9 segmentDTM
    , "0040" .@ repeated 99 segmentFTX
    , "0050" .@ repeated 9 (
      segmentGroup "1"
        [ "0060" .@ once segmentRFF
        , "0070" .@ repeated 9 segmentDTM
        ]
      )
    , "0080" .@ repeated 9 (
      segmentGroup "2"
        [ "0090" .@ once segmentLOC
        , "0100" .@ repeated 9 segmentDTM
        ]
      )
    , "0110" .@ repeated 9 (
      segmentGroup "3"
        [ "0120" .@ once segmentEQD
        , "0130" .@ repeated 9 segmentEQN
        , "0140" .@ repeated 9 segmentMEA
        , "0150" .@ repeated 9 segmentDIM
        , "0160" .@ repeated 9 segmentFTX
        ]
      )
    , "0170" .@ repeated 999 (
      segmentGroup "4"
        [ "0180" .@ once segmentTDT
        , "0190" .@ repeated 9 segmentDTM
        , "0200" .@ repeated 9 segmentTSR
        , "0210" .@ repeated 9 segmentFTX
        , "0220" .@ repeated 99 segmentEQD
        , "0230" .@ repeated 9 segmentQTY
        , "0240" .@ repeated 9 segmentMEA
        , "0250" .@ repeated 99 (
          segmentGroup "5"
            [ "0260" .@ once segmentLOC
            , "0270" .@ repeated 9 segmentDTM
            ]
          )
        ]
      )
    , "0280" .@ repeated 9 (
      segmentGroup "6"
        [ "0290" .@ once segmentNAD
        , "0300" .@ repeated 9 segmentLOC
        , "0310" .@ repeated 9 (
          segmentGroup "7"
            [ "0320" .@ once segmentCTA
            , "0330" .@ repeated 9 segmentCOM
            ]
          )
        ]
      )
    , "0340" .@ repeated 9 (
      segmentGroup "8"
        [ "0350" .@ once segmentGID
        , "0360" .@ repeated 9 segmentHAN
        , "0370" .@ repeated 9 segmentFTX
        , "0380" .@ repeated 9 (
          segmentGroup "9"
            [ "0390" .@ once segmentGDS
            , "0400" .@ repeated 9 segmentFTX
            ]
          )
        , "0410" .@ repeated 9 (
          segmentGroup "10"
            [ "0420" .@ once segmentMEA
            , "0430" .@ repeated 9 segmentEQN
            ]
          )
        , "0440" .@ repeated 9 (
          segmentGroup "11"
            [ "0450" .@ once segmentDIM
            , "0460" .@ repeated 9 segmentEQN
            ]
          )
        , "0470" .@ repeated 9 (
          segmentGroup "12"
            [ "0480" .@ once segmentDGS
            , "0490" .@ repeated 9 segmentFTX
            ]
          )
        ]
      )
    , "0500" .@ once segmentUNT
    ]
