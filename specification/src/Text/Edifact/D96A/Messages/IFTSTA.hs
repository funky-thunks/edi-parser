{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Messages.IFTSTA
  ( -- * Definition
    messageIFTSTA
    -- * Dependencies
  , segmentBGM
  , segmentCNI
  , segmentCNT
  , segmentCOM
  , segmentCTA
  , segmentDIM
  , segmentDOC
  , segmentDTM
  , segmentEQA
  , segmentEQD
  , segmentEQN
  , segmentFTX
  , segmentGID
  , segmentGIN
  , segmentHAN
  , segmentLOC
  , segmentMEA
  , segmentNAD
  , segmentPCI
  , segmentRFF
  , segmentSEL
  , segmentSTS
  , segmentTDT
  , segmentTSR
  ) where

import           Text.Edifact.Common.Segments

import           Text.Edifact.D96A.Segments   (segmentBGM, segmentCNI,
                                               segmentCNT, segmentCOM,
                                               segmentCTA, segmentDIM,
                                               segmentDOC, segmentDTM,
                                               segmentEQA, segmentEQD,
                                               segmentEQN, segmentFTX,
                                               segmentGID, segmentGIN,
                                               segmentHAN, segmentLOC,
                                               segmentMEA, segmentNAD,
                                               segmentPCI, segmentRFF,
                                               segmentSEL, segmentSTS,
                                               segmentTDT, segmentTSR)

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
-- > 0040   TSR Transport service requirements            C   1
-- >
-- > 0050       ----- Segment group 1  ------------------ C   9-----------+
-- > 0060   NAD Name and address                          M   1           |
-- >                                                                      |
-- > 0070       ----- Segment group 2  ------------------ C   9----------+|
-- > 0080   CTA Contact information                       M   1          ||
-- > 0090   COM Communication contact                     C   9----------++
-- >
-- > 0100       ----- Segment group 3  ------------------ C   9-----------+
-- > 0110   RFF Reference                                 M   1           |
-- > 0120   DTM Date/time/period                          C   1-----------+
-- > 0130   LOC Place/location identification             C   9
-- > 0140   FTX Free text                                 C   9
-- > 0150   CNT Control total                             C   9
-- >
-- > 0160       ----- Segment group 4  ------------------ C   999---------+
-- > 0170   CNI Consignment information                   M   1           |
-- > 0180   LOC Place/location identification             C   9           |
-- > 0190   CNT Control total                             C   9           |
-- >                                                                      |
-- > 0200 *     ----- Segment group 5  ------------------ M   99---------+|
-- > 0210   STS Status                                    M   1          ||
-- > 0220   RFF Reference                                 C   9          ||
-- > 0230   DTM Date/time/period                          C   9          ||
-- > 0240 + DOC Document/message details                  C   1          ||
-- > 0250   FTX Free text                                 C   9          ||
-- > 0260   NAD Name and address                          C   9          ||
-- > 0270   LOC Place/location identification             C   1          ||
-- > 0280   PCI Package identification                    C   99         ||
-- >                                                                     ||
-- > 0290       ----- Segment group 6  ------------------ C   99--------+||
-- > 0300   TDT Details of transport                      M   1         |||
-- > 0310   RFF Reference                                 C   9         |||
-- > 0320   LOC Place/location identification             C   9         |||
-- > 0330   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 0340       ----- Segment group 7  ------------------ C   99--------+||
-- > 0350   EQD Equipment details                         M   1         |||
-- > 0360   MEA Measurements                              C   9         |||
-- > 0370   DIM Dimensions                                C   9         |||
-- > 0380   SEL Seal number                               C   9         |||
-- >                                                                    |||
-- > 0390       ----- Segment group 8  ------------------ C   99-------+|||
-- > 0400   EQA Attached equipment                        M   1        ||||
-- > 0410   SEL Seal number                               C   9--------++||
-- >                                                                     ||
-- > 0420 *     ----- Segment group 9  ------------------ C   99--------+||
-- > 0430   GID Goods item details                        M   1         |||
-- > 0440   HAN Handling instructions                     C   9         |||
-- >                                                                    |||
-- > 0450       ----- Segment group 10 ------------------ C   99-------+|||
-- > 0460   MEA Measurements                              M   1        ||||
-- > 0470   EQN Number of units                           C   1--------+|||
-- >                                                                    |||
-- > 0480       ----- Segment group 11 ------------------ C   99-------+|||
-- > 0490   DIM Dimensions                                M   1        ||||
-- > 0500   EQN Number of units                           C   1--------+|||
-- >                                                                    |||
-- > 0510 +     ----- Segment group 12 ------------------ C   99-------+|||
-- > 0520 + PCI Package identification                    M   1        ||||
-- > 0530 + GIN Goods identity number                     C   9--------++++
-- > 0540   UNT Message trailer                           M   1
--
-- Dependencies: 'segmentBGM', 'segmentCNI', 'segmentCNT', 'segmentCOM', 'segmentCTA', 'segmentDIM', 'segmentDOC', 'segmentDTM', 'segmentEQA', 'segmentEQD', 'segmentEQN', 'segmentFTX', 'segmentGID', 'segmentGIN', 'segmentHAN', 'segmentLOC', 'segmentMEA', 'segmentNAD', 'segmentPCI', 'segmentRFF', 'segmentSEL', 'segmentSTS', 'segmentTDT', 'segmentTSR'.
messageIFTSTA :: Parser Value
messageIFTSTA =
  message "IFTSTA"
    [ "0010" .@ once segmentUNH
    , "0020" .@ once segmentBGM
    , "0030" .@ repeated 9 segmentDTM
    , "0040" .@ maybeOnce segmentTSR
    , "0050" .@ repeated 9 (
      segmentGroup "1"
        [ "0060" .@ once segmentNAD
        , "0070" .@ repeated 9 (
          segmentGroup "2"
            [ "0080" .@ once segmentCTA
            , "0090" .@ repeated 9 segmentCOM
            ]
          )
        ]
      )
    , "0100" .@ repeated 9 (
      segmentGroup "3"
        [ "0110" .@ once segmentRFF
        , "0120" .@ maybeOnce segmentDTM
        ]
      )
    , "0130" .@ repeated 9 segmentLOC
    , "0140" .@ repeated 9 segmentFTX
    , "0150" .@ repeated 9 segmentCNT
    , "0160" .@ repeated 999 (
      segmentGroup "4"
        [ "0170" .@ once segmentCNI
        , "0180" .@ repeated 9 segmentLOC
        , "0190" .@ repeated 9 segmentCNT
        , "0200" .@ repeatedAtLeastOnce 99 (
          segmentGroup "5"
            [ "0210" .@ once segmentSTS
            , "0220" .@ repeated 9 segmentRFF
            , "0230" .@ repeated 9 segmentDTM
            , "0240" .@ maybeOnce segmentDOC
            , "0250" .@ repeated 9 segmentFTX
            , "0260" .@ repeated 9 segmentNAD
            , "0270" .@ maybeOnce segmentLOC
            , "0280" .@ repeated 99 segmentPCI
            , "0290" .@ repeated 99 (
              segmentGroup "6"
                [ "0300" .@ once segmentTDT
                , "0310" .@ repeated 9 segmentRFF
                , "0320" .@ repeated 9 segmentLOC
                , "0330" .@ repeated 9 segmentDTM
                ]
              )
            , "0340" .@ repeated 99 (
              segmentGroup "7"
                [ "0350" .@ once segmentEQD
                , "0360" .@ repeated 9 segmentMEA
                , "0370" .@ repeated 9 segmentDIM
                , "0380" .@ repeated 9 segmentSEL
                , "0390" .@ repeated 99 (
                  segmentGroup "8"
                    [ "0400" .@ once segmentEQA
                    , "0410" .@ repeated 9 segmentSEL
                    ]
                  )
                ]
              )
            , "0420" .@ repeated 99 (
              segmentGroup "9"
                [ "0430" .@ once segmentGID
                , "0440" .@ repeated 9 segmentHAN
                , "0450" .@ repeated 99 (
                  segmentGroup "10"
                    [ "0460" .@ once segmentMEA
                    , "0470" .@ maybeOnce segmentEQN
                    ]
                  )
                , "0480" .@ repeated 99 (
                  segmentGroup "11"
                    [ "0490" .@ once segmentDIM
                    , "0500" .@ maybeOnce segmentEQN
                    ]
                  )
                , "0510" .@ repeated 99 (
                  segmentGroup "12"
                    [ "0520" .@ once segmentPCI
                    , "0530" .@ repeated 9 segmentGIN
                    ]
                  )
                ]
              )
            ]
          )
        ]
      )
    , "0540" .@ once segmentUNT
    ]
