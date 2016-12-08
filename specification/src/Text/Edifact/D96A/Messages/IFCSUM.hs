{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Messages.IFCSUM
  ( -- * Definition
    messageIFCSUM
    -- * Dependencies
  , segmentBGM
  , segmentCNI
  , segmentCNT
  , segmentCOM
  , segmentCPI
  , segmentCTA
  , segmentCUX
  , segmentDGS
  , segmentDIM
  , segmentDOC
  , segmentDTM
  , segmentEQA
  , segmentEQD
  , segmentEQN
  , segmentFTX
  , segmentGDS
  , segmentGID
  , segmentGIN
  , segmentGOR
  , segmentHAN
  , segmentLOC
  , segmentMEA
  , segmentMOA
  , segmentNAD
  , segmentPCD
  , segmentPCI
  , segmentPIA
  , segmentPRI
  , segmentQTY
  , segmentRFF
  , segmentRNG
  , segmentSEL
  , segmentSGP
  , segmentTCC
  , segmentTDT
  , segmentTMD
  , segmentTMP
  , segmentTOD
  , segmentTPL
  , segmentTSR
  ) where

import           Text.Edifact.Common.Segments

import           Text.Edifact.D96A.Segments   (segmentBGM, segmentCNI,
                                               segmentCNT, segmentCOM,
                                               segmentCPI, segmentCTA,
                                               segmentCUX, segmentDGS,
                                               segmentDIM, segmentDOC,
                                               segmentDTM, segmentEQA,
                                               segmentEQD, segmentEQN,
                                               segmentFTX, segmentGDS,
                                               segmentGID, segmentGIN,
                                               segmentGOR, segmentHAN,
                                               segmentLOC, segmentMEA,
                                               segmentMOA, segmentNAD,
                                               segmentPCD, segmentPCI,
                                               segmentPIA, segmentPRI,
                                               segmentQTY, segmentRFF,
                                               segmentRNG, segmentSEL,
                                               segmentSGP, segmentTCC,
                                               segmentTDT, segmentTMD,
                                               segmentTMP, segmentTOD,
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
-- > 0040   MOA Monetary amount                           C   99
-- > 0050   FTX Free text                                 C   99
-- > 0060   CNT Control total                             C   9
-- >
-- > 0070       ----- Segment group 1  ------------------ C   9-----------+
-- > 0080   RFF Reference                                 M   1           |
-- > 0090   DTM Date/time/period                          C   9-----------+
-- >
-- > 0100       ----- Segment group 2  ------------------ C   9-----------+
-- > 0110   GOR Governmental requirements                 M   1           |
-- > 0120   DTM Date/time/period                          C   9           |
-- > 0130   LOC Place/location identification             C   9           |
-- > 0140   SEL Seal number                               C   9           |
-- > 0150   FTX Free text                                 C   9           |
-- >                                                                      |
-- > 0160       ----- Segment group 3  ------------------ C   9----------+|
-- > 0170   DOC Document/message details                  M   1          ||
-- > 0180   DTM Date/time/period                          C   1----------++
-- >
-- > 0190       ----- Segment group 4  ------------------ C   9-----------+
-- > 0200   TCC Transport charge/rate calculations        M   1           |
-- > 0210   PRI Price details                             C   1           |
-- > 0220   EQN Number of units                           C   1           |
-- > 0230   PCD Percentage details                        C   1           |
-- > 0240   MOA Monetary amount                           C   9           |
-- > 0250   QTY Quantity                                  C   9           |
-- > 0260   LOC Place/location identification             C   9-----------+
-- >
-- > 0270       ----- Segment group 5  ------------------ C   9-----------+
-- > 0280   TDT Details of transport                      M   1           |
-- > 0290   TSR Transport service requirements            C   9           |
-- > 0300   LOC Place/location identification             C   9           |
-- > 0310   DTM Date/time/period                          C   9           |
-- > 0320   SEL Seal number                               C   9           |
-- > 0330   FTX Free text                                 C   9           |
-- >                                                                      |
-- > 0340       ----- Segment group 6  ------------------ C   9----------+|
-- > 0350   MEA Measurements                              M   1          ||
-- > 0360   EQN Number of units                           C   1----------+|
-- >                                                                      |
-- > 0370       ----- Segment group 7  ------------------ C   9----------+|
-- > 0380   DIM Dimensions                                M   1          ||
-- > 0390   EQN Number of units                           C   1----------+|
-- >                                                                      |
-- > 0400       ----- Segment group 8  ------------------ C   9----------+|
-- > 0410   CTA Contact information                       M   1          ||
-- > 0420   COM Communication contact                     C   9----------+|
-- >                                                                      |
-- > 0430       ----- Segment group 9  ------------------ C   9----------+|
-- > 0440   NAD Name and address                          M   1          ||
-- > 0450   LOC Place/location identification             C   9          ||
-- >                                                                     ||
-- > 0460       ----- Segment group 10 ------------------ C   9---------+||
-- > 0470   CTA Contact information                       M   1         |||
-- > 0480   COM Communication contact                     C   9---------+||
-- >                                                                     ||
-- > 0490       ----- Segment group 11 ------------------ C   9---------+||
-- > 0500   DOC Document/message details                  M   1         |||
-- > 0510   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 0520       ----- Segment group 12 ------------------ C   9---------+||
-- > 0530   TCC Transport charge/rate calculations        M   1         |||
-- > 0540   PRI Price details                             C   1         |||
-- > 0550   EQN Number of units                           C   1         |||
-- > 0560   PCD Percentage details                        C   1         |||
-- > 0570   MOA Monetary amount                           C   9         |||
-- > 0580   QTY Quantity                                  C   9---------+++
-- >
-- > 0590       ----- Segment group 13 ------------------ C   999---------+
-- > 0600   EQD Equipment details                         M   1           |
-- > 0610   EQN Number of units                           C   1           |
-- > 0620   TPL Transport placement                       C   1           |
-- > 0630   TMD Transport movement details                C   1           |
-- > 0640   MEA Measurements                              C   9           |
-- > 0650   DIM Dimensions                                C   9           |
-- > 0660   SEL Seal number                               C   9           |
-- > 0670   NAD Name and address                          C   9           |
-- > 0680   LOC Place/location identification             C   9           |
-- > 0690   HAN Handling instructions                     C   1           |
-- > 0700   TMP Temperature                               C   1           |
-- > 0710   FTX Free text                                 C   9           |
-- >                                                                      |
-- > 0720       ----- Segment group 14 ------------------ C   99---------+|
-- > 0730   EQA Attached equipment                        M   1          ||
-- > 0740   EQN Number of units                           C   1----------++
-- >
-- > 0750       ----- Segment group 15 ------------------ C   9999--------+
-- > 0760   CNI Consignment information                   M   1           |
-- >                                                                      |
-- > 0770       ----- Segment group 16 ------------------ C   9----------+|
-- > 0780   SGP Split goods placement                     M   1          ||
-- >                                                                     ||
-- > 0790       ----- Segment group 17 ------------------ C   9---------+||
-- > 0800   MEA Measurements                              M   1         |||
-- > 0810   EQN Number of units                           C   1---------++|
-- >                                                                      |
-- > 0820       ----- Segment group 18 ------------------ C   9----------+|
-- > 0830   TPL Transport placement                       M   1          ||
-- >                                                                     ||
-- > 0840       ----- Segment group 19 ------------------ C   9---------+||
-- > 0850   MEA Measurements                              M   1         |||
-- > 0860   EQN Number of units                           C   1---------++|
-- > 0870   CTA Contact information                       C   1           |
-- > 0880   COM Communication contact                     C   9           |
-- > 0890   DTM Date/time/period                          C   9           |
-- > 0900   CNT Control total                             C   9           |
-- > 0910   TSR Transport service requirements            C   9           |
-- > 0920   CUX Currencies                                C   9           |
-- > 0930   MOA Monetary amount                           C   99          |
-- > 0940   FTX Free text                                 C   99          |
-- >                                                                      |
-- > 0950       ----- Segment group 20 ------------------ C   99---------+|
-- > 0960   LOC Place/location identification             M   1          ||
-- > 0970   DTM Date/time/period                          C   9----------+|
-- >                                                                      |
-- > 0980       ----- Segment group 21 ------------------ C   2----------+|
-- > 0990   TOD Terms of delivery or transport            M   1          ||
-- > 1000   LOC Place/location identification             C   9----------+|
-- >                                                                      |
-- > 1010       ----- Segment group 22 ------------------ C   99---------+|
-- > 1020   RFF Reference                                 M   1          ||
-- > 1030   DTM Date/time/period                          C   9----------+|
-- >                                                                      |
-- > 1040       ----- Segment group 23 ------------------ C   9----------+|
-- > 1050   GOR Governmental requirements                 M   1          ||
-- > 1060   DTM Date/time/period                          C   9          ||
-- > 1070   LOC Place/location identification             C   9          ||
-- > 1080   SEL Seal number                               C   9          ||
-- > 1090   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 1100       ----- Segment group 24 ------------------ C   9---------+||
-- > 1110   DOC Document/message details                  M   1         |||
-- > 1120   DTM Date/time/period                          C   1---------++|
-- >                                                                      |
-- > 1130 *     ----- Segment group 25 ------------------ C   9----------+|
-- > 1140   CPI Charge payment instructions               M   1          ||
-- > 1150 + RFF Reference                                 C   99         ||
-- > 1160   CUX Currencies                                C   1          ||
-- > 1170   LOC Place/location identification             C   9          ||
-- > 1180   MOA Monetary amount                           C   9----------+|
-- >                                                                      |
-- > 1190       ----- Segment group 26 ------------------ C   99---------+|
-- > 1200   TCC Transport charge/rate calculations        M   1          ||
-- > 1210   LOC Place/location identification             C   1          ||
-- > 1220   FTX Free text                                 C   1          ||
-- > 1230   CUX Currencies                                C   1          ||
-- > 1240   PRI Price details                             C   1          ||
-- > 1250   EQN Number of units                           C   1          ||
-- > 1260   PCD Percentage details                        C   1          ||
-- > 1270   MOA Monetary amount                           C   9          ||
-- > 1280   QTY Quantity                                  C   9----------+|
-- >                                                                      |
-- > 1290       ----- Segment group 27 ------------------ C   99---------+|
-- > 1300   TDT Details of transport                      M   1          ||
-- > 1310   DTM Date/time/period                          C   9          ||
-- > 1320   TSR Transport service requirements            C   9          ||
-- >                                                                     ||
-- > 1330       ----- Segment group 28 ------------------ C   99--------+||
-- > 1340   LOC Place/location identification             M   1         |||
-- > 1350   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 1360       ----- Segment group 29 ------------------ C   9---------+||
-- > 1370   RFF Reference                                 M   1         |||
-- > 1380   DTM Date/time/period                          C   1---------++|
-- >                                                                      |
-- > 1390       ----- Segment group 30 ------------------ C   99---------+|
-- > 1400   NAD Name and address                          M   1          ||
-- > 1410   LOC Place/location identification             C   9          ||
-- > 1420   MOA Monetary amount                           C   9          ||
-- >                                                                     ||
-- > 1430       ----- Segment group 31 ------------------ C   9---------+||
-- > 1440   CTA Contact information                       M   1         |||
-- > 1450   COM Communication contact                     C   9---------+||
-- >                                                                     ||
-- > 1460       ----- Segment group 32 ------------------ C   9---------+||
-- > 1470   DOC Document/message details                  M   1         |||
-- > 1480   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 1490       ----- Segment group 33 ------------------ C   99--------+||
-- > 1500   TCC Transport charge/rate calculations        M   1         |||
-- > 1510   PRI Price details                             C   1         |||
-- > 1520   EQN Number of units                           C   1         |||
-- > 1530   PCD Percentage details                        C   1         |||
-- > 1540   MOA Monetary amount                           C   9         |||
-- > 1550   QTY Quantity                                  C   9---------+||
-- >                                                                     ||
-- > 1560       ----- Segment group 34 ------------------ C   9---------+||
-- > 1570   RFF Reference                                 M   1         |||
-- > 1580   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 1590 *     ----- Segment group 35 ------------------ C   9---------+||
-- > 1600   CPI Charge payment instructions               M   1         |||
-- > 1610 + RFF Reference                                 C   99        |||
-- > 1620   CUX Currencies                                C   1         |||
-- > 1630   LOC Place/location identification             C   9         |||
-- > 1640   MOA Monetary amount                           C   9---------+||
-- >                                                                     ||
-- > 1650       ----- Segment group 36 ------------------ C   99--------+||
-- > 1660   TSR Transport service requirements            M   1         |||
-- > 1670   RFF Reference                                 C   1         |||
-- > 1680   LOC Place/location identification             C   1         |||
-- > 1690   TPL Transport placement                       C   1         |||
-- > 1700   FTX Free text                                 C   9---------++|
-- >                                                                      |
-- > 1710       ----- Segment group 37 ------------------ C   999--------+|
-- > 1720   GID Goods item details                        M   1          ||
-- > 1730   HAN Handling instructions                     C   1          ||
-- > 1740   TMP Temperature                               C   1          ||
-- > 1750   RNG Range details                             C   1          ||
-- > 1760   TMD Transport movement details                C   1          ||
-- > 1770   LOC Place/location identification             C   9          ||
-- > 1780   MOA Monetary amount                           C   9          ||
-- > 1790   PIA Additional product id                     C   9          ||
-- > 1800   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 1810       ----- Segment group 38 ------------------ C   9---------+||
-- > 1820   NAD Name and address                          M   1         |||
-- > 1830   DTM Date/time/period                          C   1---------+||
-- > 1840   GDS Nature of cargo                           C   9          ||
-- >                                                                     ||
-- > 1850       ----- Segment group 39 ------------------ C   99--------+||
-- > 1860   MEA Measurements                              M   1         |||
-- > 1870   EQN Number of units                           C   1---------+||
-- >                                                                     ||
-- > 1880       ----- Segment group 40 ------------------ C   99--------+||
-- > 1890   DIM Dimensions                                M   1         |||
-- > 1900   EQN Number of units                           C   1---------+||
-- >                                                                     ||
-- > 1910       ----- Segment group 41 ------------------ C   9---------+||
-- > 1920   RFF Reference                                 M   1         |||
-- > 1930   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 1940 *     ----- Segment group 42 ------------------ C   9---------+||
-- > 1950   PCI Package identification                    M   1         |||
-- > 1960   RFF Reference                                 C   1         |||
-- > 1970   DTM Date/time/period                          C   1         |||
-- > 1980 + GIN Goods identity number                     C   9---------+||
-- >                                                                     ||
-- > 1990       ----- Segment group 43 ------------------ C   9---------+||
-- > 2000   DOC Document/message details                  M   1         |||
-- > 2010   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 2020       ----- Segment group 44 ------------------ C   9---------+||
-- > 2030   GOR Governmental requirements                 M   1         |||
-- > 2040   DTM Date/time/period                          C   9         |||
-- > 2050   LOC Place/location identification             C   9         |||
-- > 2060   SEL Seal number                               C   9         |||
-- > 2070   FTX Free text                                 C   9         |||
-- >                                                                    |||
-- > 2080       ----- Segment group 45 ------------------ C   9--------+|||
-- > 2090   DOC Document/message details                  M   1        ||||
-- > 2100   DTM Date/time/period                          C   1--------++||
-- >                                                                     ||
-- > 2110       ----- Segment group 46 ------------------ C   9---------+||
-- > 2120   TPL Transport placement                       M   1         |||
-- >                                                                    |||
-- > 2130       ----- Segment group 47 ------------------ C   9--------+|||
-- > 2140   MEA Measurements                              M   1        ||||
-- > 2150   EQN Number of units                           C   1--------++||
-- >                                                                     ||
-- > 2160       ----- Segment group 48 ------------------ C   999-------+||
-- > 2170   SGP Split goods placement                     M   1         |||
-- >                                                                    |||
-- > 2180       ----- Segment group 49 ------------------ C   9--------+|||
-- > 2190   MEA Measurements                              M   1        ||||
-- > 2200   EQN Number of units                           C   1--------++||
-- >                                                                     ||
-- > 2210       ----- Segment group 50 ------------------ C   99--------+||
-- > 2220   TCC Transport charge/rate calculations        M   1         |||
-- > 2230   PRI Price details                             C   1         |||
-- > 2240   EQN Number of units                           C   1         |||
-- > 2250   PCD Percentage details                        C   1         |||
-- > 2260   MOA Monetary amount                           C   9         |||
-- > 2270   QTY Quantity                                  C   9         |||
-- > 2280   LOC Place/location identification             C   9---------+||
-- >                                                                     ||
-- > 2290       ----- Segment group 51 ------------------ C   9---------+||
-- > 2300   DGS Dangerous goods                           M   1         |||
-- > 2310   FTX Free text                                 C   99        |||
-- >                                                                    |||
-- > 2320       ----- Segment group 52 ------------------ C   9--------+|||
-- > 2330   CTA Contact information                       M   1        ||||
-- > 2340   COM Communication contact                     C   9--------+|||
-- >                                                                    |||
-- > 2350       ----- Segment group 53 ------------------ C   9--------+|||
-- > 2360   MEA Measurements                              M   1        ||||
-- > 2370   EQN Number of units                           C   1--------+|||
-- >                                                                    |||
-- > 2380       ----- Segment group 54 ------------------ C   999------+|||
-- > 2390   SGP Split goods placement                     M   1        ||||
-- >                                                                   ||||
-- > 2400       ----- Segment group 55 ------------------ C   9-------+||||
-- > 2410   MEA Measurements                              M   1       |||||
-- > 2420   EQN Number of units                           C   1-------++++|
-- >                                                                      |
-- > 2430       ----- Segment group 56 ------------------ C   999--------+|
-- > 2440   EQD Equipment details                         M   1          ||
-- > 2450   EQN Number of units                           C   1          ||
-- > 2460   TMD Transport movement details                C   1          ||
-- > 2470   MEA Measurements                              C   9          ||
-- > 2480   DIM Dimensions                                C   9          ||
-- > 2490   SEL Seal number                               C   99         ||
-- > 2500   TPL Transport placement                       C   9          ||
-- > 2510   HAN Handling instructions                     C   1          ||
-- > 2520   TMP Temperature                               C   1          ||
-- > 2530   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 2540       ----- Segment group 57 ------------------ C   99--------+||
-- > 2550   TCC Transport charge/rate calculations        M   1         |||
-- > 2560   PRI Price details                             C   1         |||
-- > 2570   EQN Number of units                           C   1         |||
-- > 2580   PCD Percentage details                        C   1         |||
-- > 2590   MOA Monetary amount                           C   9         |||
-- > 2600   QTY Quantity                                  C   9---------+||
-- >                                                                     ||
-- > 2610       ----- Segment group 58 ------------------ C   9---------+||
-- > 2620   NAD Name and address                          M   1         |||
-- > 2630   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 2640       ----- Segment group 59 ------------------ C   99--------+||
-- > 2650   EQA Attached equipment                        M   1         |||
-- > 2660   EQN Number of units                           C   1---------+++
-- > 2670   UNT Message trailer                           M   1
--
-- Dependencies: 'segmentBGM', 'segmentCNI', 'segmentCNT', 'segmentCOM', 'segmentCPI', 'segmentCTA', 'segmentCUX', 'segmentDGS', 'segmentDIM', 'segmentDOC', 'segmentDTM', 'segmentEQA', 'segmentEQD', 'segmentEQN', 'segmentFTX', 'segmentGDS', 'segmentGID', 'segmentGIN', 'segmentGOR', 'segmentHAN', 'segmentLOC', 'segmentMEA', 'segmentMOA', 'segmentNAD', 'segmentPCD', 'segmentPCI', 'segmentPIA', 'segmentPRI', 'segmentQTY', 'segmentRFF', 'segmentRNG', 'segmentSEL', 'segmentSGP', 'segmentTCC', 'segmentTDT', 'segmentTMD', 'segmentTMP', 'segmentTOD', 'segmentTPL', 'segmentTSR'.
messageIFCSUM :: Parser Value
messageIFCSUM =
  message "IFCSUM"
    [ "0010" .@ once segmentUNH
    , "0020" .@ once segmentBGM
    , "0030" .@ repeated 9 segmentDTM
    , "0040" .@ repeated 99 segmentMOA
    , "0050" .@ repeated 99 segmentFTX
    , "0060" .@ repeated 9 segmentCNT
    , "0070" .@ repeated 9 (
      segmentGroup "1"
        [ "0080" .@ once segmentRFF
        , "0090" .@ repeated 9 segmentDTM
        ]
      )
    , "0100" .@ repeated 9 (
      segmentGroup "2"
        [ "0110" .@ once segmentGOR
        , "0120" .@ repeated 9 segmentDTM
        , "0130" .@ repeated 9 segmentLOC
        , "0140" .@ repeated 9 segmentSEL
        , "0150" .@ repeated 9 segmentFTX
        , "0160" .@ repeated 9 (
          segmentGroup "3"
            [ "0170" .@ once segmentDOC
            , "0180" .@ maybeOnce segmentDTM
            ]
          )
        ]
      )
    , "0190" .@ repeated 9 (
      segmentGroup "4"
        [ "0200" .@ once segmentTCC
        , "0210" .@ maybeOnce segmentPRI
        , "0220" .@ maybeOnce segmentEQN
        , "0230" .@ maybeOnce segmentPCD
        , "0240" .@ repeated 9 segmentMOA
        , "0250" .@ repeated 9 segmentQTY
        , "0260" .@ repeated 9 segmentLOC
        ]
      )
    , "0270" .@ repeated 9 (
      segmentGroup "5"
        [ "0280" .@ once segmentTDT
        , "0290" .@ repeated 9 segmentTSR
        , "0300" .@ repeated 9 segmentLOC
        , "0310" .@ repeated 9 segmentDTM
        , "0320" .@ repeated 9 segmentSEL
        , "0330" .@ repeated 9 segmentFTX
        , "0340" .@ repeated 9 (
          segmentGroup "6"
            [ "0350" .@ once segmentMEA
            , "0360" .@ maybeOnce segmentEQN
            ]
          )
        , "0370" .@ repeated 9 (
          segmentGroup "7"
            [ "0380" .@ once segmentDIM
            , "0390" .@ maybeOnce segmentEQN
            ]
          )
        , "0400" .@ repeated 9 (
          segmentGroup "8"
            [ "0410" .@ once segmentCTA
            , "0420" .@ repeated 9 segmentCOM
            ]
          )
        , "0430" .@ repeated 9 (
          segmentGroup "9"
            [ "0440" .@ once segmentNAD
            , "0450" .@ repeated 9 segmentLOC
            , "0460" .@ repeated 9 (
              segmentGroup "10"
                [ "0470" .@ once segmentCTA
                , "0480" .@ repeated 9 segmentCOM
                ]
              )
            , "0490" .@ repeated 9 (
              segmentGroup "11"
                [ "0500" .@ once segmentDOC
                , "0510" .@ maybeOnce segmentDTM
                ]
              )
            , "0520" .@ repeated 9 (
              segmentGroup "12"
                [ "0530" .@ once segmentTCC
                , "0540" .@ maybeOnce segmentPRI
                , "0550" .@ maybeOnce segmentEQN
                , "0560" .@ maybeOnce segmentPCD
                , "0570" .@ repeated 9 segmentMOA
                , "0580" .@ repeated 9 segmentQTY
                ]
              )
            ]
          )
        ]
      )
    , "0590" .@ repeated 999 (
      segmentGroup "13"
        [ "0600" .@ once segmentEQD
        , "0610" .@ maybeOnce segmentEQN
        , "0620" .@ maybeOnce segmentTPL
        , "0630" .@ maybeOnce segmentTMD
        , "0640" .@ repeated 9 segmentMEA
        , "0650" .@ repeated 9 segmentDIM
        , "0660" .@ repeated 9 segmentSEL
        , "0670" .@ repeated 9 segmentNAD
        , "0680" .@ repeated 9 segmentLOC
        , "0690" .@ maybeOnce segmentHAN
        , "0700" .@ maybeOnce segmentTMP
        , "0710" .@ repeated 9 segmentFTX
        , "0720" .@ repeated 99 (
          segmentGroup "14"
            [ "0730" .@ once segmentEQA
            , "0740" .@ maybeOnce segmentEQN
            ]
          )
        ]
      )
    , "0750" .@ repeated 9999 (
      segmentGroup "15"
        [ "0760" .@ once segmentCNI
        , "0770" .@ repeated 9 (
          segmentGroup "16"
            [ "0780" .@ once segmentSGP
            , "0790" .@ repeated 9 (
              segmentGroup "17"
                [ "0800" .@ once segmentMEA
                , "0810" .@ maybeOnce segmentEQN
                ]
              )
            ]
          )
        , "0820" .@ repeated 9 (
          segmentGroup "18"
            [ "0830" .@ once segmentTPL
            , "0840" .@ repeated 9 (
              segmentGroup "19"
                [ "0850" .@ once segmentMEA
                , "0860" .@ maybeOnce segmentEQN
                ]
              )
            ]
          )
        , "0870" .@ maybeOnce segmentCTA
        , "0880" .@ repeated 9 segmentCOM
        , "0890" .@ repeated 9 segmentDTM
        , "0900" .@ repeated 9 segmentCNT
        , "0910" .@ repeated 9 segmentTSR
        , "0920" .@ repeated 9 segmentCUX
        , "0930" .@ repeated 99 segmentMOA
        , "0940" .@ repeated 99 segmentFTX
        , "0950" .@ repeated 99 (
          segmentGroup "20"
            [ "0960" .@ once segmentLOC
            , "0970" .@ repeated 9 segmentDTM
            ]
          )
        , "0980" .@ repeated 2 (
          segmentGroup "21"
            [ "0990" .@ once segmentTOD
            , "1000" .@ repeated 9 segmentLOC
            ]
          )
        , "1010" .@ repeated 99 (
          segmentGroup "22"
            [ "1020" .@ once segmentRFF
            , "1030" .@ repeated 9 segmentDTM
            ]
          )
        , "1040" .@ repeated 9 (
          segmentGroup "23"
            [ "1050" .@ once segmentGOR
            , "1060" .@ repeated 9 segmentDTM
            , "1070" .@ repeated 9 segmentLOC
            , "1080" .@ repeated 9 segmentSEL
            , "1090" .@ repeated 9 segmentFTX
            , "1100" .@ repeated 9 (
              segmentGroup "24"
                [ "1110" .@ once segmentDOC
                , "1120" .@ maybeOnce segmentDTM
                ]
              )
            ]
          )
        , "1130" .@ repeated 9 (
          segmentGroup "25"
            [ "1140" .@ once segmentCPI
            , "1150" .@ repeated 99 segmentRFF
            , "1160" .@ maybeOnce segmentCUX
            , "1170" .@ repeated 9 segmentLOC
            , "1180" .@ repeated 9 segmentMOA
            ]
          )
        , "1190" .@ repeated 99 (
          segmentGroup "26"
            [ "1200" .@ once segmentTCC
            , "1210" .@ maybeOnce segmentLOC
            , "1220" .@ maybeOnce segmentFTX
            , "1230" .@ maybeOnce segmentCUX
            , "1240" .@ maybeOnce segmentPRI
            , "1250" .@ maybeOnce segmentEQN
            , "1260" .@ maybeOnce segmentPCD
            , "1270" .@ repeated 9 segmentMOA
            , "1280" .@ repeated 9 segmentQTY
            ]
          )
        , "1290" .@ repeated 99 (
          segmentGroup "27"
            [ "1300" .@ once segmentTDT
            , "1310" .@ repeated 9 segmentDTM
            , "1320" .@ repeated 9 segmentTSR
            , "1330" .@ repeated 99 (
              segmentGroup "28"
                [ "1340" .@ once segmentLOC
                , "1350" .@ maybeOnce segmentDTM
                ]
              )
            , "1360" .@ repeated 9 (
              segmentGroup "29"
                [ "1370" .@ once segmentRFF
                , "1380" .@ maybeOnce segmentDTM
                ]
              )
            ]
          )
        , "1390" .@ repeated 99 (
          segmentGroup "30"
            [ "1400" .@ once segmentNAD
            , "1410" .@ repeated 9 segmentLOC
            , "1420" .@ repeated 9 segmentMOA
            , "1430" .@ repeated 9 (
              segmentGroup "31"
                [ "1440" .@ once segmentCTA
                , "1450" .@ repeated 9 segmentCOM
                ]
              )
            , "1460" .@ repeated 9 (
              segmentGroup "32"
                [ "1470" .@ once segmentDOC
                , "1480" .@ maybeOnce segmentDTM
                ]
              )
            , "1490" .@ repeated 99 (
              segmentGroup "33"
                [ "1500" .@ once segmentTCC
                , "1510" .@ maybeOnce segmentPRI
                , "1520" .@ maybeOnce segmentEQN
                , "1530" .@ maybeOnce segmentPCD
                , "1540" .@ repeated 9 segmentMOA
                , "1550" .@ repeated 9 segmentQTY
                ]
              )
            , "1560" .@ repeated 9 (
              segmentGroup "34"
                [ "1570" .@ once segmentRFF
                , "1580" .@ repeated 9 segmentDTM
                ]
              )
            , "1590" .@ repeated 9 (
              segmentGroup "35"
                [ "1600" .@ once segmentCPI
                , "1610" .@ repeated 99 segmentRFF
                , "1620" .@ maybeOnce segmentCUX
                , "1630" .@ repeated 9 segmentLOC
                , "1640" .@ repeated 9 segmentMOA
                ]
              )
            , "1650" .@ repeated 99 (
              segmentGroup "36"
                [ "1660" .@ once segmentTSR
                , "1670" .@ maybeOnce segmentRFF
                , "1680" .@ maybeOnce segmentLOC
                , "1690" .@ maybeOnce segmentTPL
                , "1700" .@ repeated 9 segmentFTX
                ]
              )
            ]
          )
        , "1710" .@ repeated 999 (
          segmentGroup "37"
            [ "1720" .@ once segmentGID
            , "1730" .@ maybeOnce segmentHAN
            , "1740" .@ maybeOnce segmentTMP
            , "1750" .@ maybeOnce segmentRNG
            , "1760" .@ maybeOnce segmentTMD
            , "1770" .@ repeated 9 segmentLOC
            , "1780" .@ repeated 9 segmentMOA
            , "1790" .@ repeated 9 segmentPIA
            , "1800" .@ repeated 9 segmentFTX
            , "1810" .@ repeated 9 (
              segmentGroup "38"
                [ "1820" .@ once segmentNAD
                , "1830" .@ maybeOnce segmentDTM
                ]
              )
            , "1840" .@ repeated 9 segmentGDS
            , "1850" .@ repeated 99 (
              segmentGroup "39"
                [ "1860" .@ once segmentMEA
                , "1870" .@ maybeOnce segmentEQN
                ]
              )
            , "1880" .@ repeated 99 (
              segmentGroup "40"
                [ "1890" .@ once segmentDIM
                , "1900" .@ maybeOnce segmentEQN
                ]
              )
            , "1910" .@ repeated 9 (
              segmentGroup "41"
                [ "1920" .@ once segmentRFF
                , "1930" .@ repeated 9 segmentDTM
                ]
              )
            , "1940" .@ repeated 9 (
              segmentGroup "42"
                [ "1950" .@ once segmentPCI
                , "1960" .@ maybeOnce segmentRFF
                , "1970" .@ maybeOnce segmentDTM
                , "1980" .@ repeated 9 segmentGIN
                ]
              )
            , "1990" .@ repeated 9 (
              segmentGroup "43"
                [ "2000" .@ once segmentDOC
                , "2010" .@ repeated 9 segmentDTM
                ]
              )
            , "2020" .@ repeated 9 (
              segmentGroup "44"
                [ "2030" .@ once segmentGOR
                , "2040" .@ repeated 9 segmentDTM
                , "2050" .@ repeated 9 segmentLOC
                , "2060" .@ repeated 9 segmentSEL
                , "2070" .@ repeated 9 segmentFTX
                , "2080" .@ repeated 9 (
                  segmentGroup "45"
                    [ "2090" .@ once segmentDOC
                    , "2100" .@ maybeOnce segmentDTM
                    ]
                  )
                ]
              )
            , "2110" .@ repeated 9 (
              segmentGroup "46"
                [ "2120" .@ once segmentTPL
                , "2130" .@ repeated 9 (
                  segmentGroup "47"
                    [ "2140" .@ once segmentMEA
                    , "2150" .@ maybeOnce segmentEQN
                    ]
                  )
                ]
              )
            , "2160" .@ repeated 999 (
              segmentGroup "48"
                [ "2170" .@ once segmentSGP
                , "2180" .@ repeated 9 (
                  segmentGroup "49"
                    [ "2190" .@ once segmentMEA
                    , "2200" .@ maybeOnce segmentEQN
                    ]
                  )
                ]
              )
            , "2210" .@ repeated 99 (
              segmentGroup "50"
                [ "2220" .@ once segmentTCC
                , "2230" .@ maybeOnce segmentPRI
                , "2240" .@ maybeOnce segmentEQN
                , "2250" .@ maybeOnce segmentPCD
                , "2260" .@ repeated 9 segmentMOA
                , "2270" .@ repeated 9 segmentQTY
                , "2280" .@ repeated 9 segmentLOC
                ]
              )
            , "2290" .@ repeated 9 (
              segmentGroup "51"
                [ "2300" .@ once segmentDGS
                , "2310" .@ repeated 99 segmentFTX
                , "2320" .@ repeated 9 (
                  segmentGroup "52"
                    [ "2330" .@ once segmentCTA
                    , "2340" .@ repeated 9 segmentCOM
                    ]
                  )
                , "2350" .@ repeated 9 (
                  segmentGroup "53"
                    [ "2360" .@ once segmentMEA
                    , "2370" .@ maybeOnce segmentEQN
                    ]
                  )
                , "2380" .@ repeated 999 (
                  segmentGroup "54"
                    [ "2390" .@ once segmentSGP
                    , "2400" .@ repeated 9 (
                      segmentGroup "55"
                        [ "2410" .@ once segmentMEA
                        , "2420" .@ maybeOnce segmentEQN
                        ]
                      )
                    ]
                  )
                ]
              )
            ]
          )
        , "2430" .@ repeated 999 (
          segmentGroup "56"
            [ "2440" .@ once segmentEQD
            , "2450" .@ maybeOnce segmentEQN
            , "2460" .@ maybeOnce segmentTMD
            , "2470" .@ repeated 9 segmentMEA
            , "2480" .@ repeated 9 segmentDIM
            , "2490" .@ repeated 99 segmentSEL
            , "2500" .@ repeated 9 segmentTPL
            , "2510" .@ maybeOnce segmentHAN
            , "2520" .@ maybeOnce segmentTMP
            , "2530" .@ repeated 9 segmentFTX
            , "2540" .@ repeated 99 (
              segmentGroup "57"
                [ "2550" .@ once segmentTCC
                , "2560" .@ maybeOnce segmentPRI
                , "2570" .@ maybeOnce segmentEQN
                , "2580" .@ maybeOnce segmentPCD
                , "2590" .@ repeated 9 segmentMOA
                , "2600" .@ repeated 9 segmentQTY
                ]
              )
            , "2610" .@ repeated 9 (
              segmentGroup "58"
                [ "2620" .@ once segmentNAD
                , "2630" .@ maybeOnce segmentDTM
                ]
              )
            , "2640" .@ repeated 99 (
              segmentGroup "59"
                [ "2650" .@ once segmentEQA
                , "2660" .@ maybeOnce segmentEQN
                ]
              )
            ]
          )
        ]
      )
    , "2670" .@ once segmentUNT
    ]
