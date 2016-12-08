{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Messages.IFTSTA
  ( -- * Definition
    messageIFTSTA
    -- * Dependencies
  , segmentBGM
  , segmentCNI
  , segmentCNT
  , segmentCOM
  , segmentCTA
  , segmentDGS
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
  , segmentSGP
  , segmentSTS
  , segmentTDT
  , segmentTMD
  , segmentTPL
  , segmentTSR
  ) where

import           Text.Edifact.Common.Segments

import           Text.Edifact.D01B.Segments   (segmentBGM, segmentCNI,
                                               segmentCNT, segmentCOM,
                                               segmentCTA, segmentDGS,
                                               segmentDIM, segmentDOC,
                                               segmentDTM, segmentEQA,
                                               segmentEQD, segmentEQN,
                                               segmentFTX, segmentGID,
                                               segmentGIN, segmentHAN,
                                               segmentLOC, segmentMEA,
                                               segmentNAD, segmentPCI,
                                               segmentRFF, segmentSEL,
                                               segmentSGP, segmentSTS,
                                               segmentTDT, segmentTMD,
                                               segmentTPL, segmentTSR)

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
-- > 0160       ----- Segment group 4  ------------------ C   99999-------+
-- > 0170   CNI Consignment information                   M   1           |
-- > 0180   LOC Place/location identification             C   9           |
-- > 0190   CNT Control total                             C   9           |
-- >                                                                      |
-- > 0200       ----- Segment group 5  ------------------ M   99---------+|
-- > 0210   STS Status                                    M   1          ||
-- > 0220   RFF Reference                                 C   999        ||
-- > 0230   DTM Date/time/period                          C   9          ||
-- > 0240   DOC Document/message details                  C   1          ||
-- > 0250   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 0260       ----- Segment group 6  ------------------ C   9---------+||
-- > 0270   NAD Name and address                          M   1         |||
-- >                                                                    |||
-- > 0280       ----- Segment group 7  ------------------ C   9--------+|||
-- > 0290   CTA Contact information                       M   1        ||||
-- > 0300   COM Communication contact                     C   9--------++||
-- > 0310   LOC Place/location identification             C   1          ||
-- > 0320   PCI Package identification                    C   99         ||
-- >                                                                     ||
-- > 0330       ----- Segment group 8  ------------------ C   99--------+||
-- > 0340   TDT Details of transport                      M   1         |||
-- > 0350   DTM Date/time/period                          C   9         |||
-- > 0360   RFF Reference                                 C   9         |||
-- >                                                                    |||
-- > 0370       ----- Segment group 9  ------------------ C   9--------+|||
-- > 0380   LOC Place/location identification             M   1        ||||
-- > 0390   DTM Date/time/period                          C   9--------++||
-- >                                                                     ||
-- > 0400       ----- Segment group 10 ------------------ C   99--------+||
-- > 0410   EQD Equipment details                         M   1         |||
-- > 0420   MEA Measurements                              C   9         |||
-- > 0430   DIM Dimensions                                C   9         |||
-- > 0440   SEL Seal number                               C   9         |||
-- > 0450   RFF Reference                                 C   9         |||
-- > 0460   TPL Transport placement                       C   9         |||
-- > 0470   TMD Transport movement details                C   1         |||
-- >                                                                    |||
-- > 0480       ----- Segment group 11 ------------------ C   99-------+|||
-- > 0490   EQA Attached equipment                        M   1        ||||
-- > 0500   SEL Seal number                               C   9--------++||
-- >                                                                     ||
-- > 0510       ----- Segment group 12 ------------------ C   99--------+||
-- > 0520   GID Goods item details                        M   1         |||
-- > 0530   HAN Handling instructions                     C   9         |||
-- > 0540   SGP Split goods placement                     C   99        |||
-- > 0550   DGS Dangerous goods                           C   9         |||
-- > 0560   FTX Free text                                 C   9         |||
-- >                                                                    |||
-- > 0570       ----- Segment group 13 ------------------ C   99-------+|||
-- > 0580   MEA Measurements                              M   1        ||||
-- > 0590   EQN Number of units                           C   1--------+|||
-- >                                                                    |||
-- > 0600       ----- Segment group 14 ------------------ C   99-------+|||
-- > 0610   DIM Dimensions                                M   1        ||||
-- > 0620   EQN Number of units                           C   1--------+|||
-- >                                                                    |||
-- > 0630       ----- Segment group 15 ------------------ C   99-------+|||
-- > 0640   PCI Package identification                    M   1        ||||
-- > 0650   GIN Goods identity number                     C   9--------++++
-- > 0660   UNT Message trailer                           M   1
--
-- Dependencies: 'segmentBGM', 'segmentCNI', 'segmentCNT', 'segmentCOM', 'segmentCTA', 'segmentDGS', 'segmentDIM', 'segmentDOC', 'segmentDTM', 'segmentEQA', 'segmentEQD', 'segmentEQN', 'segmentFTX', 'segmentGID', 'segmentGIN', 'segmentHAN', 'segmentLOC', 'segmentMEA', 'segmentNAD', 'segmentPCI', 'segmentRFF', 'segmentSEL', 'segmentSGP', 'segmentSTS', 'segmentTDT', 'segmentTMD', 'segmentTPL', 'segmentTSR'.
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
    , "0160" .@ repeated 99999 (
      segmentGroup "4"
        [ "0170" .@ once segmentCNI
        , "0180" .@ repeated 9 segmentLOC
        , "0190" .@ repeated 9 segmentCNT
        , "0200" .@ repeatedAtLeastOnce 99 (
          segmentGroup "5"
            [ "0210" .@ once segmentSTS
            , "0220" .@ repeated 999 segmentRFF
            , "0230" .@ repeated 9 segmentDTM
            , "0240" .@ maybeOnce segmentDOC
            , "0250" .@ repeated 9 segmentFTX
            , "0260" .@ repeated 9 (
              segmentGroup "6"
                [ "0270" .@ once segmentNAD
                , "0280" .@ repeated 9 (
                  segmentGroup "7"
                    [ "0290" .@ once segmentCTA
                    , "0300" .@ repeated 9 segmentCOM
                    ]
                  )
                ]
              )
            , "0310" .@ maybeOnce segmentLOC
            , "0320" .@ repeated 99 segmentPCI
            , "0330" .@ repeated 99 (
              segmentGroup "8"
                [ "0340" .@ once segmentTDT
                , "0350" .@ repeated 9 segmentDTM
                , "0360" .@ repeated 9 segmentRFF
                , "0370" .@ repeated 9 (
                  segmentGroup "9"
                    [ "0380" .@ once segmentLOC
                    , "0390" .@ repeated 9 segmentDTM
                    ]
                  )
                ]
              )
            , "0400" .@ repeated 99 (
              segmentGroup "10"
                [ "0410" .@ once segmentEQD
                , "0420" .@ repeated 9 segmentMEA
                , "0430" .@ repeated 9 segmentDIM
                , "0440" .@ repeated 9 segmentSEL
                , "0450" .@ repeated 9 segmentRFF
                , "0460" .@ repeated 9 segmentTPL
                , "0470" .@ maybeOnce segmentTMD
                , "0480" .@ repeated 99 (
                  segmentGroup "11"
                    [ "0490" .@ once segmentEQA
                    , "0500" .@ repeated 9 segmentSEL
                    ]
                  )
                ]
              )
            , "0510" .@ repeated 99 (
              segmentGroup "12"
                [ "0520" .@ once segmentGID
                , "0530" .@ repeated 9 segmentHAN
                , "0540" .@ repeated 99 segmentSGP
                , "0550" .@ repeated 9 segmentDGS
                , "0560" .@ repeated 9 segmentFTX
                , "0570" .@ repeated 99 (
                  segmentGroup "13"
                    [ "0580" .@ once segmentMEA
                    , "0590" .@ maybeOnce segmentEQN
                    ]
                  )
                , "0600" .@ repeated 99 (
                  segmentGroup "14"
                    [ "0610" .@ once segmentDIM
                    , "0620" .@ maybeOnce segmentEQN
                    ]
                  )
                , "0630" .@ repeated 99 (
                  segmentGroup "15"
                    [ "0640" .@ once segmentPCI
                    , "0650" .@ repeated 9 segmentGIN
                    ]
                  )
                ]
              )
            ]
          )
        ]
      )
    , "0660" .@ once segmentUNT
    ]
