{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Messages.DESADV
  ( -- * Definition
    messageDESADV
    -- * Dependencies
  , segmentALI
  , segmentBGM
  , segmentCNT
  , segmentCOM
  , segmentCPS
  , segmentCTA
  , segmentDGS
  , segmentDLM
  , segmentDTM
  , segmentEQA
  , segmentEQD
  , segmentFTX
  , segmentGIN
  , segmentGIR
  , segmentHAN
  , segmentIMD
  , segmentLIN
  , segmentLOC
  , segmentMEA
  , segmentMOA
  , segmentNAD
  , segmentPAC
  , segmentPCD
  , segmentPCI
  , segmentPIA
  , segmentQTY
  , segmentQVR
  , segmentRFF
  , segmentSEL
  , segmentSGP
  , segmentTDT
  , segmentTOD
  ) where

import           Text.Edifact.Common.Segments

import           Text.Edifact.D96A.Segments   (segmentALI, segmentBGM,
                                               segmentCNT, segmentCOM,
                                               segmentCPS, segmentCTA,
                                               segmentDGS, segmentDLM,
                                               segmentDTM, segmentEQA,
                                               segmentEQD, segmentFTX,
                                               segmentGIN, segmentGIR,
                                               segmentHAN, segmentIMD,
                                               segmentLIN, segmentLOC,
                                               segmentMEA, segmentMOA,
                                               segmentNAD, segmentPAC,
                                               segmentPCD, segmentPCI,
                                               segmentPIA, segmentQTY,
                                               segmentQVR, segmentRFF,
                                               segmentSEL, segmentSGP,
                                               segmentTDT, segmentTOD)

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
-- >            HEADER SECTION
-- >
-- > 0010   UNH Message header                            M   1
-- > 0020   BGM Beginning of message                      M   1
-- > 0030   DTM Date/time/period                          C   10
-- > 0040   ALI Additional information                    C   5
-- > 0050   MEA Measurements                              C   5
-- > 0060   MOA Monetary amount                           C   5
-- >
-- > 0070       ----- Segment group 1  ------------------ C   10----------+
-- > 0080   RFF Reference                                 M   1           |
-- > 0090   DTM Date/time/period                          C   1-----------+
-- >
-- > 0100       ----- Segment group 2  ------------------ C   10----------+
-- > 0110   NAD Name and address                          M   1           |
-- > 0120   LOC Place/location identification             C   10          |
-- >                                                                      |
-- > 0130       ----- Segment group 3  ------------------ C   10---------+|
-- > 0140   RFF Reference                                 M   1          ||
-- > 0150   DTM Date/time/period                          C   1----------+|
-- >                                                                      |
-- > 0160       ----- Segment group 4  ------------------ C   10---------+|
-- > 0170   CTA Contact information                       M   1          ||
-- > 0180   COM Communication contact                     C   5----------++
-- >
-- > 0190       ----- Segment group 5  ------------------ C   10----------+
-- > 0200   TOD Terms of delivery or transport            M   1           |
-- > 0210   LOC Place/location identification             C   5           |
-- > 0220   FTX Free text                                 C   5-----------+
-- >
-- > 0230       ----- Segment group 6  ------------------ C   10----------+
-- > 0240   TDT Details of transport                      M   1           |
-- > 0250   PCD Percentage details                        C   6           |
-- >                                                                      |
-- > 0260       ----- Segment group 7  ------------------ C   10---------+|
-- > 0270   LOC Place/location identification             M   1          ||
-- > 0280   DTM Date/time/period                          C   10---------++
-- >
-- > 0290       ----- Segment group 8  ------------------ C   10----------+
-- > 0300   EQD Equipment details                         M   1           |
-- > 0310   MEA Measurements                              C   5           |
-- > 0320   SEL Seal number                               C   25          |
-- > 0330   EQA Attached equipment                        C   5           |
-- >                                                                      |
-- > 0340       ----- Segment group 9  ------------------ C   10---------+|
-- > 0350   HAN Handling instructions                     M   1          ||
-- > 0360   FTX Free text                                 C   10---------++
-- >
-- >            DETAIL SECTION
-- >
-- > 0370       ----- Segment group 10 ------------------ C   9999--------+
-- > 0380   CPS Consignment packing sequence              M   1           |
-- > 0390   FTX Free text                                 C   5           |
-- >                                                                      |
-- > 0400       ----- Segment group 11 ------------------ C   9999-------+|
-- > 0410   PAC Package                                   M   1          ||
-- > 0420   MEA Measurements                              C   10         ||
-- > 0430   QTY Quantity                                  C   10         ||
-- >                                                                     ||
-- > 0440       ----- Segment group 12 ------------------ C   10--------+||
-- > 0450   HAN Handling instructions                     M   1         |||
-- > 0460   FTX Free text                                 C   10--------+||
-- >                                                                     ||
-- > 0470 *     ----- Segment group 13 ------------------ C   1000------+||
-- > 0480   PCI Package identification                    M   1         |||
-- > 0490   RFF Reference                                 C   1         |||
-- > 0500   DTM Date/time/period                          C   5         |||
-- > 0510 * GIR Related identification numbers            C   99        |||
-- >                                                                    |||
-- > 0520       ----- Segment group 14 ------------------ C   99-------+|||
-- > 0530   GIN Goods identity number                     M   1        ||||
-- > 0540   DLM Delivery limitations                      C   10-------+++|
-- >                                                                      |
-- > 0550       ----- Segment group 15 ------------------ C   9999-------+|
-- > 0560   LIN Line item                                 M   1          ||
-- > 0570   PIA Additional product id                     C   10         ||
-- > 0580   IMD Item description                          C   25         ||
-- > 0590   MEA Measurements                              C   10         ||
-- > 0600   QTY Quantity                                  C   10         ||
-- > 0610   ALI Additional information                    C   10         ||
-- > 0620   GIN Goods identity number                     C   100        ||
-- > 0630   GIR Related identification numbers            C   100        ||
-- > 0640   DLM Delivery limitations                      C   100        ||
-- > 0650   DTM Date/time/period                          C   5          ||
-- > 0660   FTX Free text                                 C   5          ||
-- > 0670   MOA Monetary amount                           C   5          ||
-- >                                                                     ||
-- > 0680       ----- Segment group 16 ------------------ C   10--------+||
-- > 0690   RFF Reference                                 M   1         |||
-- > 0700   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 0710       ----- Segment group 17 ------------------ C   10--------+||
-- > 0720   DGS Dangerous goods                           M   1         |||
-- > 0730   QTY Quantity                                  C   1         |||
-- > 0740   FTX Free text                                 C   5---------+||
-- >                                                                     ||
-- > 0750       ----- Segment group 18 ------------------ C   100-------+||
-- > 0760   LOC Place/location identification             M   1         |||
-- > 0770   NAD Name and address                          C   1         |||
-- > 0780   DTM Date/time/period                          C   1         |||
-- > 0790   QTY Quantity                                  C   10--------+||
-- >                                                                     ||
-- > 0800       ----- Segment group 19 ------------------ C   1000------+||
-- > 0810   SGP Split goods placement                     M   1         |||
-- > 0820   QTY Quantity                                  C   10--------+||
-- >                                                                     ||
-- > 0830       ----- Segment group 20 ------------------ C   9999------+||
-- > 0840   PCI Package identification                    M   1         |||
-- > 0850   DTM Date/time/period                          C   5         |||
-- > 0860   MEA Measurements                              C   10        |||
-- > 0870   QTY Quantity                                  C   1         |||
-- >                                                                    |||
-- > 0880       ----- Segment group 21 ------------------ C   10-------+|||
-- > 0890   GIN Goods identity number                     M   1        ||||
-- > 0900   DLM Delivery limitations                      C   100------+|||
-- >                                                                    |||
-- > 0910       ----- Segment group 22 ------------------ C   10-------+|||
-- > 0920   HAN Handling instructions                     M   1        ||||
-- > 0930   FTX Free text                                 C   5        ||||
-- > 0940   GIN Goods identity number                     C   1000-----++||
-- >                                                                     ||
-- > 0950       ----- Segment group 23 ------------------ C   10--------+||
-- > 0960   QVR Quantity variances                        M   1         |||
-- > 0970   DTM Date/time/period                          C   5---------+++
-- >
-- >            SUMMARY SECTION
-- >
-- > 0980   CNT Control total                             C   5
-- > 0990   UNT Message trailer                           M   1
--
-- Dependencies: 'segmentALI', 'segmentBGM', 'segmentCNT', 'segmentCOM', 'segmentCPS', 'segmentCTA', 'segmentDGS', 'segmentDLM', 'segmentDTM', 'segmentEQA', 'segmentEQD', 'segmentFTX', 'segmentGIN', 'segmentGIR', 'segmentHAN', 'segmentIMD', 'segmentLIN', 'segmentLOC', 'segmentMEA', 'segmentMOA', 'segmentNAD', 'segmentPAC', 'segmentPCD', 'segmentPCI', 'segmentPIA', 'segmentQTY', 'segmentQVR', 'segmentRFF', 'segmentSEL', 'segmentSGP', 'segmentTDT', 'segmentTOD'.
messageDESADV :: Parser Value
messageDESADV =
  message "DESADV"
    [ "0010" .@ once segmentUNH
    , "0020" .@ once segmentBGM
    , "0030" .@ repeated 10 segmentDTM
    , "0040" .@ repeated 5 segmentALI
    , "0050" .@ repeated 5 segmentMEA
    , "0060" .@ repeated 5 segmentMOA
    , "0070" .@ repeated 10 (
      segmentGroup "1"
        [ "0080" .@ once segmentRFF
        , "0090" .@ maybeOnce segmentDTM
        ]
      )
    , "0100" .@ repeated 10 (
      segmentGroup "2"
        [ "0110" .@ once segmentNAD
        , "0120" .@ repeated 10 segmentLOC
        , "0130" .@ repeated 10 (
          segmentGroup "3"
            [ "0140" .@ once segmentRFF
            , "0150" .@ maybeOnce segmentDTM
            ]
          )
        , "0160" .@ repeated 10 (
          segmentGroup "4"
            [ "0170" .@ once segmentCTA
            , "0180" .@ repeated 5 segmentCOM
            ]
          )
        ]
      )
    , "0190" .@ repeated 10 (
      segmentGroup "5"
        [ "0200" .@ once segmentTOD
        , "0210" .@ repeated 5 segmentLOC
        , "0220" .@ repeated 5 segmentFTX
        ]
      )
    , "0230" .@ repeated 10 (
      segmentGroup "6"
        [ "0240" .@ once segmentTDT
        , "0250" .@ repeated 6 segmentPCD
        , "0260" .@ repeated 10 (
          segmentGroup "7"
            [ "0270" .@ once segmentLOC
            , "0280" .@ repeated 10 segmentDTM
            ]
          )
        ]
      )
    , "0290" .@ repeated 10 (
      segmentGroup "8"
        [ "0300" .@ once segmentEQD
        , "0310" .@ repeated 5 segmentMEA
        , "0320" .@ repeated 25 segmentSEL
        , "0330" .@ repeated 5 segmentEQA
        , "0340" .@ repeated 10 (
          segmentGroup "9"
            [ "0350" .@ once segmentHAN
            , "0360" .@ repeated 10 segmentFTX
            ]
          )
        ]
      )
    , "0370" .@ repeated 9999 (
      segmentGroup "10"
        [ "0380" .@ once segmentCPS
        , "0390" .@ repeated 5 segmentFTX
        , "0400" .@ repeated 9999 (
          segmentGroup "11"
            [ "0410" .@ once segmentPAC
            , "0420" .@ repeated 10 segmentMEA
            , "0430" .@ repeated 10 segmentQTY
            , "0440" .@ repeated 10 (
              segmentGroup "12"
                [ "0450" .@ once segmentHAN
                , "0460" .@ repeated 10 segmentFTX
                ]
              )
            , "0470" .@ repeated 1000 (
              segmentGroup "13"
                [ "0480" .@ once segmentPCI
                , "0490" .@ maybeOnce segmentRFF
                , "0500" .@ repeated 5 segmentDTM
                , "0510" .@ repeated 99 segmentGIR
                , "0520" .@ repeated 99 (
                  segmentGroup "14"
                    [ "0530" .@ once segmentGIN
                    , "0540" .@ repeated 10 segmentDLM
                    ]
                  )
                ]
              )
            ]
          )
        , "0550" .@ repeated 9999 (
          segmentGroup "15"
            [ "0560" .@ once segmentLIN
            , "0570" .@ repeated 10 segmentPIA
            , "0580" .@ repeated 25 segmentIMD
            , "0590" .@ repeated 10 segmentMEA
            , "0600" .@ repeated 10 segmentQTY
            , "0610" .@ repeated 10 segmentALI
            , "0620" .@ repeated 100 segmentGIN
            , "0630" .@ repeated 100 segmentGIR
            , "0640" .@ repeated 100 segmentDLM
            , "0650" .@ repeated 5 segmentDTM
            , "0660" .@ repeated 5 segmentFTX
            , "0670" .@ repeated 5 segmentMOA
            , "0680" .@ repeated 10 (
              segmentGroup "16"
                [ "0690" .@ once segmentRFF
                , "0700" .@ maybeOnce segmentDTM
                ]
              )
            , "0710" .@ repeated 10 (
              segmentGroup "17"
                [ "0720" .@ once segmentDGS
                , "0730" .@ maybeOnce segmentQTY
                , "0740" .@ repeated 5 segmentFTX
                ]
              )
            , "0750" .@ repeated 100 (
              segmentGroup "18"
                [ "0760" .@ once segmentLOC
                , "0770" .@ maybeOnce segmentNAD
                , "0780" .@ maybeOnce segmentDTM
                , "0790" .@ repeated 10 segmentQTY
                ]
              )
            , "0800" .@ repeated 1000 (
              segmentGroup "19"
                [ "0810" .@ once segmentSGP
                , "0820" .@ repeated 10 segmentQTY
                ]
              )
            , "0830" .@ repeated 9999 (
              segmentGroup "20"
                [ "0840" .@ once segmentPCI
                , "0850" .@ repeated 5 segmentDTM
                , "0860" .@ repeated 10 segmentMEA
                , "0870" .@ maybeOnce segmentQTY
                , "0880" .@ repeated 10 (
                  segmentGroup "21"
                    [ "0890" .@ once segmentGIN
                    , "0900" .@ repeated 100 segmentDLM
                    ]
                  )
                , "0910" .@ repeated 10 (
                  segmentGroup "22"
                    [ "0920" .@ once segmentHAN
                    , "0930" .@ repeated 5 segmentFTX
                    , "0940" .@ repeated 1000 segmentGIN
                    ]
                  )
                ]
              )
            , "0950" .@ repeated 10 (
              segmentGroup "23"
                [ "0960" .@ once segmentQVR
                , "0970" .@ repeated 5 segmentDTM
                ]
              )
            ]
          )
        ]
      )
    , "0980" .@ repeated 5 segmentCNT
    , "0990" .@ once segmentUNT
    ]
