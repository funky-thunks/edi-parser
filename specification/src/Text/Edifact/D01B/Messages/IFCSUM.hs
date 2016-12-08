{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Messages.IFCSUM
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
  , segmentICD
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
  , segmentSEQ
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

import           Text.Edifact.D01B.Segments   (segmentBGM, segmentCNI,
                                               segmentCNT, segmentCOM,
                                               segmentCPI, segmentCTA,
                                               segmentCUX, segmentDGS,
                                               segmentDIM, segmentDOC,
                                               segmentDTM, segmentEQA,
                                               segmentEQD, segmentEQN,
                                               segmentFTX, segmentGDS,
                                               segmentGID, segmentGIN,
                                               segmentGOR, segmentHAN,
                                               segmentICD, segmentLOC,
                                               segmentMEA, segmentMOA,
                                               segmentNAD, segmentPCD,
                                               segmentPCI, segmentPIA,
                                               segmentPRI, segmentQTY,
                                               segmentRFF, segmentRNG,
                                               segmentSEL, segmentSEQ,
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
-- > 0070   PCD Percentage details                        C   1
-- > 0080   GDS Nature of cargo                           C   9
-- >
-- > 0090       ----- Segment group 1  ------------------ C   9-----------+
-- > 0100   RFF Reference                                 M   1           |
-- > 0110   DTM Date/time/period                          C   9-----------+
-- >
-- > 0120       ----- Segment group 2  ------------------ C   9-----------+
-- > 0130   GOR Governmental requirements                 M   1           |
-- > 0140   DTM Date/time/period                          C   9           |
-- > 0150   LOC Place/location identification             C   9           |
-- > 0160   SEL Seal number                               C   9           |
-- > 0170   FTX Free text                                 C   9           |
-- >                                                                      |
-- > 0180       ----- Segment group 3  ------------------ C   9----------+|
-- > 0190   DOC Document/message details                  M   1          ||
-- > 0200   DTM Date/time/period                          C   1----------++
-- >
-- > 0210       ----- Segment group 4  ------------------ C   9-----------+
-- > 0220   NAD Name and address                          M   1           |
-- >                                                                      |
-- > 0230       ----- Segment group 5  ------------------ C   9----------+|
-- > 0240   CTA Contact information                       M   1          ||
-- > 0250   COM Communication contact                     C   9----------+|
-- >                                                                      |
-- > 0260       ----- Segment group 6  ------------------ C   9----------+|
-- > 0270   RFF Reference                                 M   1          ||
-- > 0280   DTM Date/time/period                          C   9----------++
-- >
-- > 0290       ----- Segment group 7  ------------------ C   9-----------+
-- > 0300   TCC Charge/rate calculations                  M   1           |
-- > 0310   CUX Currencies                                C   1           |
-- > 0320   PRI Price details                             C   1           |
-- > 0330   EQN Number of units                           C   1           |
-- > 0340   PCD Percentage details                        C   1           |
-- > 0350   MOA Monetary amount                           C   9           |
-- > 0360   QTY Quantity                                  C   9           |
-- > 0370   LOC Place/location identification             C   9-----------+
-- >
-- > 0380       ----- Segment group 8  ------------------ C   99----------+
-- > 0390   ICD Insurance cover description               M   1           |
-- > 0400   DTM Date/time/period                          C   1           |
-- > 0410   FTX Free text                                 C   9-----------+
-- >
-- > 0420       ----- Segment group 9  ------------------ C   9-----------+
-- > 0430   TDT Details of transport                      M   1           |
-- > 0440   DTM Date/time/period                          C   9           |
-- > 0450   TSR Transport service requirements            C   9           |
-- >                                                                      |
-- > 0460       ----- Segment group 10 ------------------ C   9----------+|
-- > 0470   LOC Place/location identification             M   1          ||
-- > 0480   DTM Date/time/period                          C   9----------+|
-- > 0490   SEL Seal number                               C   9           |
-- > 0500   FTX Free text                                 C   9           |
-- >                                                                      |
-- > 0510       ----- Segment group 11 ------------------ C   9----------+|
-- > 0520   MEA Measurements                              M   1          ||
-- > 0530   EQN Number of units                           C   1----------+|
-- >                                                                      |
-- > 0540       ----- Segment group 12 ------------------ C   9----------+|
-- > 0550   DIM Dimensions                                M   1          ||
-- > 0560   EQN Number of units                           C   1----------+|
-- >                                                                      |
-- > 0570       ----- Segment group 13 ------------------ C   9----------+|
-- > 0580   CTA Contact information                       M   1          ||
-- > 0590   COM Communication contact                     C   9----------+|
-- >                                                                      |
-- > 0600       ----- Segment group 14 ------------------ C   99---------+|
-- > 0610   TCC Charge/rate calculations                  M   1          ||
-- > 0620   MOA Monetary amount                           C   9          ||
-- > 0630   PCD Percentage details                        C   1----------+|
-- >                                                                      |
-- > 0640       ----- Segment group 15 ------------------ C   99---------+|
-- > 0650   ICD Insurance cover description               M   1          ||
-- > 0660   DTM Date/time/period                          C   1          ||
-- > 0670   FTX Free text                                 C   9----------+|
-- >                                                                      |
-- > 0680       ----- Segment group 16 ------------------ C   9----------+|
-- > 0690   NAD Name and address                          M   1          ||
-- > 0700   LOC Place/location identification             C   9          ||
-- >                                                                     ||
-- > 0710       ----- Segment group 17 ------------------ C   9---------+||
-- > 0720   CTA Contact information                       M   1         |||
-- > 0730   COM Communication contact                     C   9---------+||
-- >                                                                     ||
-- > 0740       ----- Segment group 18 ------------------ C   9---------+||
-- > 0750   DOC Document/message details                  M   1         |||
-- > 0760   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 0770       ----- Segment group 19 ------------------ C   9---------+||
-- > 0780   TCC Charge/rate calculations                  M   1         |||
-- > 0790   CUX Currencies                                C   1         |||
-- > 0800   PRI Price details                             C   1         |||
-- > 0810   EQN Number of units                           C   1         |||
-- > 0820   PCD Percentage details                        C   1         |||
-- > 0830   MOA Monetary amount                           C   9         |||
-- > 0840   QTY Quantity                                  C   9---------+||
-- >                                                                     ||
-- > 0850       ----- Segment group 20 ------------------ C   9---------+||
-- > 0860   RFF Reference                                 M   1         |||
-- > 0870   DTM Date/time/period                          C   9---------+++
-- >
-- > 0880       ----- Segment group 21 ------------------ C   999---------+
-- > 0890   EQD Equipment details                         M   1           |
-- > 0900   EQN Number of units                           C   1           |
-- > 0910   TPL Transport placement                       C   1           |
-- > 0920   TMD Transport movement details                C   1           |
-- > 0930   MEA Measurements                              C   9           |
-- > 0940   DIM Dimensions                                C   9           |
-- > 0950   SEL Seal number                               C   9           |
-- > 0960   NAD Name and address                          C   9           |
-- > 0970   LOC Place/location identification             C   9           |
-- > 0980   HAN Handling instructions                     C   1           |
-- > 0990   TMP Temperature                               C   1           |
-- > 1000   FTX Free text                                 C   9           |
-- > 1010   RFF Reference                                 C   9           |
-- > 1020   PCD Percentage details                        C   9           |
-- >                                                                      |
-- > 1030       ----- Segment group 22 ------------------ C   99---------+|
-- > 1040   EQA Attached equipment                        M   1          ||
-- > 1050   EQN Number of units                           C   1----------+|
-- >                                                                      |
-- > 1060       ----- Segment group 23 ------------------ C   99---------+|
-- > 1070   DGS Dangerous goods                           M   1          ||
-- > 1080   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 1090       ----- Segment group 24 ------------------ M   1---------+||
-- > 1100   CTA Contact information                       M   1         |||
-- > 1110   COM Communication contact                     C   9---------+++
-- >
-- > 1120       ----- Segment group 25 ------------------ C   9999--------+
-- > 1130   CNI Consignment information                   M   1           |
-- >                                                                      |
-- > 1140       ----- Segment group 26 ------------------ C   9----------+|
-- > 1150   SGP Split goods placement                     M   1          ||
-- >                                                                     ||
-- > 1160       ----- Segment group 27 ------------------ C   9---------+||
-- > 1170   MEA Measurements                              M   1         |||
-- > 1180   EQN Number of units                           C   1---------++|
-- >                                                                      |
-- > 1190       ----- Segment group 28 ------------------ C   9----------+|
-- > 1200   TPL Transport placement                       M   1          ||
-- >                                                                     ||
-- > 1210       ----- Segment group 29 ------------------ C   9---------+||
-- > 1220   MEA Measurements                              M   1         |||
-- > 1230   EQN Number of units                           C   1---------++|
-- > 1240   CTA Contact information                       C   1           |
-- > 1250   COM Communication contact                     C   9           |
-- > 1260   DTM Date/time/period                          C   9           |
-- > 1270   CNT Control total                             C   9           |
-- > 1280   TSR Transport service requirements            C   9           |
-- > 1290   CUX Currencies                                C   9           |
-- > 1300   PCD Percentage details                        C   9           |
-- > 1310   MOA Monetary amount                           C   99          |
-- > 1320   FTX Free text                                 C   99          |
-- > 1330   GDS Nature of cargo                           C   9           |
-- >                                                                      |
-- > 1340       ----- Segment group 30 ------------------ C   99---------+|
-- > 1350   LOC Place/location identification             M   1          ||
-- > 1360   DTM Date/time/period                          C   9----------+|
-- >                                                                      |
-- > 1370       ----- Segment group 31 ------------------ C   2----------+|
-- > 1380   TOD Terms of delivery or transport            M   1          ||
-- > 1390   LOC Place/location identification             C   9----------+|
-- >                                                                      |
-- > 1400       ----- Segment group 32 ------------------ C   999--------+|
-- > 1410   RFF Reference                                 M   1          ||
-- > 1420   DTM Date/time/period                          C   9----------+|
-- >                                                                      |
-- > 1430       ----- Segment group 33 ------------------ C   9----------+|
-- > 1440   GOR Governmental requirements                 M   1          ||
-- > 1450   DTM Date/time/period                          C   9          ||
-- > 1460   LOC Place/location identification             C   9          ||
-- > 1470   SEL Seal number                               C   9          ||
-- > 1480   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 1490       ----- Segment group 34 ------------------ C   9---------+||
-- > 1500   DOC Document/message details                  M   1         |||
-- > 1510   DTM Date/time/period                          C   1---------++|
-- >                                                                      |
-- > 1520       ----- Segment group 35 ------------------ C   9----------+|
-- > 1530   CPI Charge payment instructions               M   1          ||
-- > 1540   RFF Reference                                 C   99         ||
-- > 1550   CUX Currencies                                C   1          ||
-- > 1560   LOC Place/location identification             C   9          ||
-- > 1570   MOA Monetary amount                           C   9----------+|
-- >                                                                      |
-- > 1580       ----- Segment group 36 ------------------ C   99---------+|
-- > 1590   TCC Charge/rate calculations                  M   1          ||
-- > 1600   LOC Place/location identification             C   1          ||
-- > 1610   FTX Free text                                 C   1          ||
-- > 1620   CUX Currencies                                C   1          ||
-- > 1630   PRI Price details                             C   1          ||
-- > 1640   EQN Number of units                           C   1          ||
-- > 1650   PCD Percentage details                        C   1          ||
-- > 1660   MOA Monetary amount                           C   9          ||
-- > 1670   QTY Quantity                                  C   9----------+|
-- >                                                                      |
-- > 1680       ----- Segment group 37 ------------------ C   99---------+|
-- > 1690   ICD Insurance cover description               M   1          ||
-- > 1700   DTM Date/time/period                          C   1          ||
-- > 1710   FTX Free text                                 C   9----------+|
-- >                                                                      |
-- > 1720       ----- Segment group 38 ------------------ C   99---------+|
-- > 1730   TDT Details of transport                      M   1          ||
-- > 1740   DTM Date/time/period                          C   9          ||
-- > 1750   TSR Transport service requirements            C   9          ||
-- >                                                                     ||
-- > 1760       ----- Segment group 39 ------------------ C   99--------+||
-- > 1770   LOC Place/location identification             M   1         |||
-- > 1780   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 1790       ----- Segment group 40 ------------------ C   9---------+||
-- > 1800   RFF Reference                                 M   1         |||
-- > 1810   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 1820       ----- Segment group 41 ------------------ C   99--------+||
-- > 1830   TCC Charge/rate calculations                  M   1         |||
-- > 1840   MOA Monetary amount                           C   9         |||
-- > 1850   PCD Percentage details                        C   1---------+||
-- >                                                                     ||
-- > 1860       ----- Segment group 42 ------------------ C   99--------+||
-- > 1870   ICD Insurance cover description               M   1         |||
-- > 1880   DTM Date/time/period                          C   1         |||
-- > 1890   FTX Free text                                 C   9---------++|
-- >                                                                      |
-- > 1900       ----- Segment group 43 ------------------ C   99---------+|
-- > 1910   NAD Name and address                          M   1          ||
-- > 1920   LOC Place/location identification             C   9          ||
-- > 1930   MOA Monetary amount                           C   9          ||
-- >                                                                     ||
-- > 1940       ----- Segment group 44 ------------------ C   9---------+||
-- > 1950   CTA Contact information                       M   1         |||
-- > 1960   COM Communication contact                     C   9---------+||
-- >                                                                     ||
-- > 1970       ----- Segment group 45 ------------------ C   9---------+||
-- > 1980   DOC Document/message details                  M   1         |||
-- > 1990   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 2000       ----- Segment group 46 ------------------ C   99--------+||
-- > 2010   TCC Charge/rate calculations                  M   1         |||
-- > 2020   CUX Currencies                                C   1         |||
-- > 2030   PRI Price details                             C   1         |||
-- > 2040   EQN Number of units                           C   1         |||
-- > 2050   PCD Percentage details                        C   1         |||
-- > 2060   MOA Monetary amount                           C   9         |||
-- > 2070   QTY Quantity                                  C   9---------+||
-- >                                                                     ||
-- > 2080       ----- Segment group 47 ------------------ C   9---------+||
-- > 2090   RFF Reference                                 M   1         |||
-- > 2100   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 2110       ----- Segment group 48 ------------------ C   9---------+||
-- > 2120   CPI Charge payment instructions               M   1         |||
-- > 2130   RFF Reference                                 C   99        |||
-- > 2140   CUX Currencies                                C   1         |||
-- > 2150   LOC Place/location identification             C   9         |||
-- > 2160   MOA Monetary amount                           C   9---------+||
-- >                                                                     ||
-- > 2170       ----- Segment group 49 ------------------ C   99--------+||
-- > 2180   TSR Transport service requirements            M   1         |||
-- > 2190   RFF Reference                                 C   1         |||
-- > 2200   LOC Place/location identification             C   1         |||
-- > 2210   TPL Transport placement                       C   1         |||
-- > 2220   FTX Free text                                 C   9---------++|
-- >                                                                      |
-- > 2230       ----- Segment group 50 ------------------ C   999--------+|
-- > 2240   GID Goods item details                        M   1          ||
-- > 2250   HAN Handling instructions                     C   1          ||
-- > 2260   TMP Temperature                               C   1          ||
-- > 2270   RNG Range details                             C   1          ||
-- > 2280   TMD Transport movement details                C   1          ||
-- > 2290   LOC Place/location identification             C   9          ||
-- > 2300   MOA Monetary amount                           C   9          ||
-- > 2310   PIA Additional product id                     C   9          ||
-- > 2320   GIN Goods identity number                     C   99         ||
-- > 2330   FTX Free text                                 C   9          ||
-- >                                                                     ||
-- > 2340       ----- Segment group 51 ------------------ C   9---------+||
-- > 2350   NAD Name and address                          M   1         |||
-- > 2360   DTM Date/time/period                          C   1---------+||
-- > 2370   GDS Nature of cargo                           C   9          ||
-- >                                                                     ||
-- > 2380       ----- Segment group 52 ------------------ C   99--------+||
-- > 2390   MEA Measurements                              M   1         |||
-- > 2400   EQN Number of units                           C   1---------+||
-- >                                                                     ||
-- > 2410       ----- Segment group 53 ------------------ C   99--------+||
-- > 2420   DIM Dimensions                                M   1         |||
-- > 2430   EQN Number of units                           C   1---------+||
-- >                                                                     ||
-- > 2440       ----- Segment group 54 ------------------ C   9---------+||
-- > 2450   RFF Reference                                 M   1         |||
-- > 2460   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 2470       ----- Segment group 55 ------------------ C   999-------+||
-- > 2480   PCI Package identification                    M   1         |||
-- > 2490   RFF Reference                                 C   1         |||
-- > 2500   DTM Date/time/period                          C   1         |||
-- > 2510   GIN Goods identity number                     C   9         |||
-- > 2520   MEA Measurements                              C   9         |||
-- > 2530   DIM Dimensions                                C   1         |||
-- > 2540   FTX Free text                                 C   9---------+||
-- >                                                                     ||
-- > 2550       ----- Segment group 56 ------------------ C   9---------+||
-- > 2560   DOC Document/message details                  M   1         |||
-- > 2570   DTM Date/time/period                          C   9---------+||
-- >                                                                     ||
-- > 2580       ----- Segment group 57 ------------------ C   9---------+||
-- > 2590   GOR Governmental requirements                 M   1         |||
-- > 2600   DTM Date/time/period                          C   9         |||
-- > 2610   LOC Place/location identification             C   9         |||
-- > 2620   SEL Seal number                               C   9         |||
-- > 2630   FTX Free text                                 C   9         |||
-- >                                                                    |||
-- > 2640       ----- Segment group 58 ------------------ C   9--------+|||
-- > 2650   DOC Document/message details                  M   1        ||||
-- > 2660   DTM Date/time/period                          C   1--------++||
-- >                                                                     ||
-- > 2670       ----- Segment group 59 ------------------ C   9---------+||
-- > 2680   TPL Transport placement                       M   1         |||
-- >                                                                    |||
-- > 2690       ----- Segment group 60 ------------------ C   9--------+|||
-- > 2700   MEA Measurements                              M   1        ||||
-- > 2710   EQN Number of units                           C   1--------++||
-- >                                                                     ||
-- > 2720       ----- Segment group 61 ------------------ C   999-------+||
-- > 2730   SGP Split goods placement                     M   1         |||
-- > 2740   SEQ Sequence details                          C   1         |||
-- >                                                                    |||
-- > 2750       ----- Segment group 62 ------------------ C   9--------+|||
-- > 2760   MEA Measurements                              M   1        ||||
-- > 2770   EQN Number of units                           C   1--------++||
-- >                                                                     ||
-- > 2780       ----- Segment group 63 ------------------ C   99--------+||
-- > 2790   TCC Charge/rate calculations                  M   1         |||
-- > 2800   CUX Currencies                                C   1         |||
-- > 2810   PRI Price details                             C   1         |||
-- > 2820   EQN Number of units                           C   1         |||
-- > 2830   PCD Percentage details                        C   1         |||
-- > 2840   MOA Monetary amount                           C   9         |||
-- > 2850   QTY Quantity                                  C   9         |||
-- > 2860   LOC Place/location identification             C   9---------+||
-- >                                                                     ||
-- > 2870       ----- Segment group 64 ------------------ C   99--------+||
-- > 2880   ICD Insurance cover description               M   1         |||
-- > 2890   DTM Date/time/period                          C   1         |||
-- > 2900   FTX Free text                                 C   9---------+||
-- >                                                                     ||
-- > 2910       ----- Segment group 65 ------------------ C   99--------+||
-- > 2920   DGS Dangerous goods                           M   1         |||
-- > 2930   FTX Free text                                 C   99        |||
-- >                                                                    |||
-- > 2940       ----- Segment group 66 ------------------ C   9--------+|||
-- > 2950   CTA Contact information                       M   1        ||||
-- > 2960   COM Communication contact                     C   9--------+|||
-- >                                                                    |||
-- > 2970       ----- Segment group 67 ------------------ C   9--------+|||
-- > 2980   MEA Measurements                              M   1        ||||
-- > 2990   EQN Number of units                           C   1--------+|||
-- >                                                                    |||
-- > 3000       ----- Segment group 68 ------------------ C   999------+|||
-- > 3010   SGP Split goods placement                     M   1        ||||
-- >                                                                   ||||
-- > 3020       ----- Segment group 69 ------------------ C   9-------+||||
-- > 3030   MEA Measurements                              M   1       |||||
-- > 3040   EQN Number of units                           C   1-------++++|
-- >                                                                      |
-- > 3050       ----- Segment group 70 ------------------ C   999--------+|
-- > 3060   EQD Equipment details                         M   1          ||
-- > 3070   EQN Number of units                           C   1          ||
-- > 3080   TMD Transport movement details                C   1          ||
-- > 3090   MEA Measurements                              C   9          ||
-- > 3100   DIM Dimensions                                C   9          ||
-- > 3110   SEL Seal number                               C   99         ||
-- > 3120   TPL Transport placement                       C   9          ||
-- > 3130   HAN Handling instructions                     C   1          ||
-- > 3140   TMP Temperature                               C   1          ||
-- > 3150   FTX Free text                                 C   9          ||
-- > 3160   PCD Percentage details                        C   9          ||
-- >                                                                     ||
-- > 3170       ----- Segment group 71 ------------------ C   99--------+||
-- > 3180   TCC Charge/rate calculations                  M   1         |||
-- > 3190   CUX Currencies                                C   1         |||
-- > 3200   PRI Price details                             C   1         |||
-- > 3210   EQN Number of units                           C   1         |||
-- > 3220   PCD Percentage details                        C   1         |||
-- > 3230   MOA Monetary amount                           C   9         |||
-- > 3240   QTY Quantity                                  C   9---------+||
-- >                                                                     ||
-- > 3250       ----- Segment group 72 ------------------ C   9---------+||
-- > 3260   NAD Name and address                          M   1         |||
-- > 3270   DTM Date/time/period                          C   1---------+||
-- >                                                                     ||
-- > 3280       ----- Segment group 73 ------------------ C   99--------+||
-- > 3290   EQA Attached equipment                        M   1         |||
-- > 3300   EQN Number of units                           C   1---------+||
-- >                                                                     ||
-- > 3310       ----- Segment group 74 ------------------ C   99--------+||
-- > 3320   DGS Dangerous goods                           M   1         |||
-- > 3330   FTX Free text                                 C   9         |||
-- >                                                                    |||
-- > 3340       ----- Segment group 75 ------------------ C   9--------+|||
-- > 3350   CTA Contact information                       M   1        ||||
-- > 3360   COM Communication contact                     C   9--------++++
-- > 3370   UNT Message trailer                           M   1
--
-- Dependencies: 'segmentBGM', 'segmentCNI', 'segmentCNT', 'segmentCOM', 'segmentCPI', 'segmentCTA', 'segmentCUX', 'segmentDGS', 'segmentDIM', 'segmentDOC', 'segmentDTM', 'segmentEQA', 'segmentEQD', 'segmentEQN', 'segmentFTX', 'segmentGDS', 'segmentGID', 'segmentGIN', 'segmentGOR', 'segmentHAN', 'segmentICD', 'segmentLOC', 'segmentMEA', 'segmentMOA', 'segmentNAD', 'segmentPCD', 'segmentPCI', 'segmentPIA', 'segmentPRI', 'segmentQTY', 'segmentRFF', 'segmentRNG', 'segmentSEL', 'segmentSEQ', 'segmentSGP', 'segmentTCC', 'segmentTDT', 'segmentTMD', 'segmentTMP', 'segmentTOD', 'segmentTPL', 'segmentTSR'.
messageIFCSUM :: Parser Value
messageIFCSUM =
  message "IFCSUM"
    [ "0010" .@ once segmentUNH
    , "0020" .@ once segmentBGM
    , "0030" .@ repeated 9 segmentDTM
    , "0040" .@ repeated 99 segmentMOA
    , "0050" .@ repeated 99 segmentFTX
    , "0060" .@ repeated 9 segmentCNT
    , "0070" .@ maybeOnce segmentPCD
    , "0080" .@ repeated 9 segmentGDS
    , "0090" .@ repeated 9 (
      segmentGroup "1"
        [ "0100" .@ once segmentRFF
        , "0110" .@ repeated 9 segmentDTM
        ]
      )
    , "0120" .@ repeated 9 (
      segmentGroup "2"
        [ "0130" .@ once segmentGOR
        , "0140" .@ repeated 9 segmentDTM
        , "0150" .@ repeated 9 segmentLOC
        , "0160" .@ repeated 9 segmentSEL
        , "0170" .@ repeated 9 segmentFTX
        , "0180" .@ repeated 9 (
          segmentGroup "3"
            [ "0190" .@ once segmentDOC
            , "0200" .@ maybeOnce segmentDTM
            ]
          )
        ]
      )
    , "0210" .@ repeated 9 (
      segmentGroup "4"
        [ "0220" .@ once segmentNAD
        , "0230" .@ repeated 9 (
          segmentGroup "5"
            [ "0240" .@ once segmentCTA
            , "0250" .@ repeated 9 segmentCOM
            ]
          )
        , "0260" .@ repeated 9 (
          segmentGroup "6"
            [ "0270" .@ once segmentRFF
            , "0280" .@ repeated 9 segmentDTM
            ]
          )
        ]
      )
    , "0290" .@ repeated 9 (
      segmentGroup "7"
        [ "0300" .@ once segmentTCC
        , "0310" .@ maybeOnce segmentCUX
        , "0320" .@ maybeOnce segmentPRI
        , "0330" .@ maybeOnce segmentEQN
        , "0340" .@ maybeOnce segmentPCD
        , "0350" .@ repeated 9 segmentMOA
        , "0360" .@ repeated 9 segmentQTY
        , "0370" .@ repeated 9 segmentLOC
        ]
      )
    , "0380" .@ repeated 99 (
      segmentGroup "8"
        [ "0390" .@ once segmentICD
        , "0400" .@ maybeOnce segmentDTM
        , "0410" .@ repeated 9 segmentFTX
        ]
      )
    , "0420" .@ repeated 9 (
      segmentGroup "9"
        [ "0430" .@ once segmentTDT
        , "0440" .@ repeated 9 segmentDTM
        , "0450" .@ repeated 9 segmentTSR
        , "0460" .@ repeated 9 (
          segmentGroup "10"
            [ "0470" .@ once segmentLOC
            , "0480" .@ repeated 9 segmentDTM
            ]
          )
        , "0490" .@ repeated 9 segmentSEL
        , "0500" .@ repeated 9 segmentFTX
        , "0510" .@ repeated 9 (
          segmentGroup "11"
            [ "0520" .@ once segmentMEA
            , "0530" .@ maybeOnce segmentEQN
            ]
          )
        , "0540" .@ repeated 9 (
          segmentGroup "12"
            [ "0550" .@ once segmentDIM
            , "0560" .@ maybeOnce segmentEQN
            ]
          )
        , "0570" .@ repeated 9 (
          segmentGroup "13"
            [ "0580" .@ once segmentCTA
            , "0590" .@ repeated 9 segmentCOM
            ]
          )
        , "0600" .@ repeated 99 (
          segmentGroup "14"
            [ "0610" .@ once segmentTCC
            , "0620" .@ repeated 9 segmentMOA
            , "0630" .@ maybeOnce segmentPCD
            ]
          )
        , "0640" .@ repeated 99 (
          segmentGroup "15"
            [ "0650" .@ once segmentICD
            , "0660" .@ maybeOnce segmentDTM
            , "0670" .@ repeated 9 segmentFTX
            ]
          )
        , "0680" .@ repeated 9 (
          segmentGroup "16"
            [ "0690" .@ once segmentNAD
            , "0700" .@ repeated 9 segmentLOC
            , "0710" .@ repeated 9 (
              segmentGroup "17"
                [ "0720" .@ once segmentCTA
                , "0730" .@ repeated 9 segmentCOM
                ]
              )
            , "0740" .@ repeated 9 (
              segmentGroup "18"
                [ "0750" .@ once segmentDOC
                , "0760" .@ maybeOnce segmentDTM
                ]
              )
            , "0770" .@ repeated 9 (
              segmentGroup "19"
                [ "0780" .@ once segmentTCC
                , "0790" .@ maybeOnce segmentCUX
                , "0800" .@ maybeOnce segmentPRI
                , "0810" .@ maybeOnce segmentEQN
                , "0820" .@ maybeOnce segmentPCD
                , "0830" .@ repeated 9 segmentMOA
                , "0840" .@ repeated 9 segmentQTY
                ]
              )
            , "0850" .@ repeated 9 (
              segmentGroup "20"
                [ "0860" .@ once segmentRFF
                , "0870" .@ repeated 9 segmentDTM
                ]
              )
            ]
          )
        ]
      )
    , "0880" .@ repeated 999 (
      segmentGroup "21"
        [ "0890" .@ once segmentEQD
        , "0900" .@ maybeOnce segmentEQN
        , "0910" .@ maybeOnce segmentTPL
        , "0920" .@ maybeOnce segmentTMD
        , "0930" .@ repeated 9 segmentMEA
        , "0940" .@ repeated 9 segmentDIM
        , "0950" .@ repeated 9 segmentSEL
        , "0960" .@ repeated 9 segmentNAD
        , "0970" .@ repeated 9 segmentLOC
        , "0980" .@ maybeOnce segmentHAN
        , "0990" .@ maybeOnce segmentTMP
        , "1000" .@ repeated 9 segmentFTX
        , "1010" .@ repeated 9 segmentRFF
        , "1020" .@ repeated 9 segmentPCD
        , "1030" .@ repeated 99 (
          segmentGroup "22"
            [ "1040" .@ once segmentEQA
            , "1050" .@ maybeOnce segmentEQN
            ]
          )
        , "1060" .@ repeated 99 (
          segmentGroup "23"
            [ "1070" .@ once segmentDGS
            , "1080" .@ repeated 9 segmentFTX
            , "1090" .@ once (
              segmentGroup "24"
                [ "1100" .@ once segmentCTA
                , "1110" .@ repeated 9 segmentCOM
                ]
              )
            ]
          )
        ]
      )
    , "1120" .@ repeated 9999 (
      segmentGroup "25"
        [ "1130" .@ once segmentCNI
        , "1140" .@ repeated 9 (
          segmentGroup "26"
            [ "1150" .@ once segmentSGP
            , "1160" .@ repeated 9 (
              segmentGroup "27"
                [ "1170" .@ once segmentMEA
                , "1180" .@ maybeOnce segmentEQN
                ]
              )
            ]
          )
        , "1190" .@ repeated 9 (
          segmentGroup "28"
            [ "1200" .@ once segmentTPL
            , "1210" .@ repeated 9 (
              segmentGroup "29"
                [ "1220" .@ once segmentMEA
                , "1230" .@ maybeOnce segmentEQN
                ]
              )
            ]
          )
        , "1240" .@ maybeOnce segmentCTA
        , "1250" .@ repeated 9 segmentCOM
        , "1260" .@ repeated 9 segmentDTM
        , "1270" .@ repeated 9 segmentCNT
        , "1280" .@ repeated 9 segmentTSR
        , "1290" .@ repeated 9 segmentCUX
        , "1300" .@ repeated 9 segmentPCD
        , "1310" .@ repeated 99 segmentMOA
        , "1320" .@ repeated 99 segmentFTX
        , "1330" .@ repeated 9 segmentGDS
        , "1340" .@ repeated 99 (
          segmentGroup "30"
            [ "1350" .@ once segmentLOC
            , "1360" .@ repeated 9 segmentDTM
            ]
          )
        , "1370" .@ repeated 2 (
          segmentGroup "31"
            [ "1380" .@ once segmentTOD
            , "1390" .@ repeated 9 segmentLOC
            ]
          )
        , "1400" .@ repeated 999 (
          segmentGroup "32"
            [ "1410" .@ once segmentRFF
            , "1420" .@ repeated 9 segmentDTM
            ]
          )
        , "1430" .@ repeated 9 (
          segmentGroup "33"
            [ "1440" .@ once segmentGOR
            , "1450" .@ repeated 9 segmentDTM
            , "1460" .@ repeated 9 segmentLOC
            , "1470" .@ repeated 9 segmentSEL
            , "1480" .@ repeated 9 segmentFTX
            , "1490" .@ repeated 9 (
              segmentGroup "34"
                [ "1500" .@ once segmentDOC
                , "1510" .@ maybeOnce segmentDTM
                ]
              )
            ]
          )
        , "1520" .@ repeated 9 (
          segmentGroup "35"
            [ "1530" .@ once segmentCPI
            , "1540" .@ repeated 99 segmentRFF
            , "1550" .@ maybeOnce segmentCUX
            , "1560" .@ repeated 9 segmentLOC
            , "1570" .@ repeated 9 segmentMOA
            ]
          )
        , "1580" .@ repeated 99 (
          segmentGroup "36"
            [ "1590" .@ once segmentTCC
            , "1600" .@ maybeOnce segmentLOC
            , "1610" .@ maybeOnce segmentFTX
            , "1620" .@ maybeOnce segmentCUX
            , "1630" .@ maybeOnce segmentPRI
            , "1640" .@ maybeOnce segmentEQN
            , "1650" .@ maybeOnce segmentPCD
            , "1660" .@ repeated 9 segmentMOA
            , "1670" .@ repeated 9 segmentQTY
            ]
          )
        , "1680" .@ repeated 99 (
          segmentGroup "37"
            [ "1690" .@ once segmentICD
            , "1700" .@ maybeOnce segmentDTM
            , "1710" .@ repeated 9 segmentFTX
            ]
          )
        , "1720" .@ repeated 99 (
          segmentGroup "38"
            [ "1730" .@ once segmentTDT
            , "1740" .@ repeated 9 segmentDTM
            , "1750" .@ repeated 9 segmentTSR
            , "1760" .@ repeated 99 (
              segmentGroup "39"
                [ "1770" .@ once segmentLOC
                , "1780" .@ repeated 9 segmentDTM
                ]
              )
            , "1790" .@ repeated 9 (
              segmentGroup "40"
                [ "1800" .@ once segmentRFF
                , "1810" .@ maybeOnce segmentDTM
                ]
              )
            , "1820" .@ repeated 99 (
              segmentGroup "41"
                [ "1830" .@ once segmentTCC
                , "1840" .@ repeated 9 segmentMOA
                , "1850" .@ maybeOnce segmentPCD
                ]
              )
            , "1860" .@ repeated 99 (
              segmentGroup "42"
                [ "1870" .@ once segmentICD
                , "1880" .@ maybeOnce segmentDTM
                , "1890" .@ repeated 9 segmentFTX
                ]
              )
            ]
          )
        , "1900" .@ repeated 99 (
          segmentGroup "43"
            [ "1910" .@ once segmentNAD
            , "1920" .@ repeated 9 segmentLOC
            , "1930" .@ repeated 9 segmentMOA
            , "1940" .@ repeated 9 (
              segmentGroup "44"
                [ "1950" .@ once segmentCTA
                , "1960" .@ repeated 9 segmentCOM
                ]
              )
            , "1970" .@ repeated 9 (
              segmentGroup "45"
                [ "1980" .@ once segmentDOC
                , "1990" .@ maybeOnce segmentDTM
                ]
              )
            , "2000" .@ repeated 99 (
              segmentGroup "46"
                [ "2010" .@ once segmentTCC
                , "2020" .@ maybeOnce segmentCUX
                , "2030" .@ maybeOnce segmentPRI
                , "2040" .@ maybeOnce segmentEQN
                , "2050" .@ maybeOnce segmentPCD
                , "2060" .@ repeated 9 segmentMOA
                , "2070" .@ repeated 9 segmentQTY
                ]
              )
            , "2080" .@ repeated 9 (
              segmentGroup "47"
                [ "2090" .@ once segmentRFF
                , "2100" .@ repeated 9 segmentDTM
                ]
              )
            , "2110" .@ repeated 9 (
              segmentGroup "48"
                [ "2120" .@ once segmentCPI
                , "2130" .@ repeated 99 segmentRFF
                , "2140" .@ maybeOnce segmentCUX
                , "2150" .@ repeated 9 segmentLOC
                , "2160" .@ repeated 9 segmentMOA
                ]
              )
            , "2170" .@ repeated 99 (
              segmentGroup "49"
                [ "2180" .@ once segmentTSR
                , "2190" .@ maybeOnce segmentRFF
                , "2200" .@ maybeOnce segmentLOC
                , "2210" .@ maybeOnce segmentTPL
                , "2220" .@ repeated 9 segmentFTX
                ]
              )
            ]
          )
        , "2230" .@ repeated 999 (
          segmentGroup "50"
            [ "2240" .@ once segmentGID
            , "2250" .@ maybeOnce segmentHAN
            , "2260" .@ maybeOnce segmentTMP
            , "2270" .@ maybeOnce segmentRNG
            , "2280" .@ maybeOnce segmentTMD
            , "2290" .@ repeated 9 segmentLOC
            , "2300" .@ repeated 9 segmentMOA
            , "2310" .@ repeated 9 segmentPIA
            , "2320" .@ repeated 99 segmentGIN
            , "2330" .@ repeated 9 segmentFTX
            , "2340" .@ repeated 9 (
              segmentGroup "51"
                [ "2350" .@ once segmentNAD
                , "2360" .@ maybeOnce segmentDTM
                ]
              )
            , "2370" .@ repeated 9 segmentGDS
            , "2380" .@ repeated 99 (
              segmentGroup "52"
                [ "2390" .@ once segmentMEA
                , "2400" .@ maybeOnce segmentEQN
                ]
              )
            , "2410" .@ repeated 99 (
              segmentGroup "53"
                [ "2420" .@ once segmentDIM
                , "2430" .@ maybeOnce segmentEQN
                ]
              )
            , "2440" .@ repeated 9 (
              segmentGroup "54"
                [ "2450" .@ once segmentRFF
                , "2460" .@ repeated 9 segmentDTM
                ]
              )
            , "2470" .@ repeated 999 (
              segmentGroup "55"
                [ "2480" .@ once segmentPCI
                , "2490" .@ maybeOnce segmentRFF
                , "2500" .@ maybeOnce segmentDTM
                , "2510" .@ repeated 9 segmentGIN
                , "2520" .@ repeated 9 segmentMEA
                , "2530" .@ maybeOnce segmentDIM
                , "2540" .@ repeated 9 segmentFTX
                ]
              )
            , "2550" .@ repeated 9 (
              segmentGroup "56"
                [ "2560" .@ once segmentDOC
                , "2570" .@ repeated 9 segmentDTM
                ]
              )
            , "2580" .@ repeated 9 (
              segmentGroup "57"
                [ "2590" .@ once segmentGOR
                , "2600" .@ repeated 9 segmentDTM
                , "2610" .@ repeated 9 segmentLOC
                , "2620" .@ repeated 9 segmentSEL
                , "2630" .@ repeated 9 segmentFTX
                , "2640" .@ repeated 9 (
                  segmentGroup "58"
                    [ "2650" .@ once segmentDOC
                    , "2660" .@ maybeOnce segmentDTM
                    ]
                  )
                ]
              )
            , "2670" .@ repeated 9 (
              segmentGroup "59"
                [ "2680" .@ once segmentTPL
                , "2690" .@ repeated 9 (
                  segmentGroup "60"
                    [ "2700" .@ once segmentMEA
                    , "2710" .@ maybeOnce segmentEQN
                    ]
                  )
                ]
              )
            , "2720" .@ repeated 999 (
              segmentGroup "61"
                [ "2730" .@ once segmentSGP
                , "2740" .@ maybeOnce segmentSEQ
                , "2750" .@ repeated 9 (
                  segmentGroup "62"
                    [ "2760" .@ once segmentMEA
                    , "2770" .@ maybeOnce segmentEQN
                    ]
                  )
                ]
              )
            , "2780" .@ repeated 99 (
              segmentGroup "63"
                [ "2790" .@ once segmentTCC
                , "2800" .@ maybeOnce segmentCUX
                , "2810" .@ maybeOnce segmentPRI
                , "2820" .@ maybeOnce segmentEQN
                , "2830" .@ maybeOnce segmentPCD
                , "2840" .@ repeated 9 segmentMOA
                , "2850" .@ repeated 9 segmentQTY
                , "2860" .@ repeated 9 segmentLOC
                ]
              )
            , "2870" .@ repeated 99 (
              segmentGroup "64"
                [ "2880" .@ once segmentICD
                , "2890" .@ maybeOnce segmentDTM
                , "2900" .@ repeated 9 segmentFTX
                ]
              )
            , "2910" .@ repeated 99 (
              segmentGroup "65"
                [ "2920" .@ once segmentDGS
                , "2930" .@ repeated 99 segmentFTX
                , "2940" .@ repeated 9 (
                  segmentGroup "66"
                    [ "2950" .@ once segmentCTA
                    , "2960" .@ repeated 9 segmentCOM
                    ]
                  )
                , "2970" .@ repeated 9 (
                  segmentGroup "67"
                    [ "2980" .@ once segmentMEA
                    , "2990" .@ maybeOnce segmentEQN
                    ]
                  )
                , "3000" .@ repeated 999 (
                  segmentGroup "68"
                    [ "3010" .@ once segmentSGP
                    , "3020" .@ repeated 9 (
                      segmentGroup "69"
                        [ "3030" .@ once segmentMEA
                        , "3040" .@ maybeOnce segmentEQN
                        ]
                      )
                    ]
                  )
                ]
              )
            ]
          )
        , "3050" .@ repeated 999 (
          segmentGroup "70"
            [ "3060" .@ once segmentEQD
            , "3070" .@ maybeOnce segmentEQN
            , "3080" .@ maybeOnce segmentTMD
            , "3090" .@ repeated 9 segmentMEA
            , "3100" .@ repeated 9 segmentDIM
            , "3110" .@ repeated 99 segmentSEL
            , "3120" .@ repeated 9 segmentTPL
            , "3130" .@ maybeOnce segmentHAN
            , "3140" .@ maybeOnce segmentTMP
            , "3150" .@ repeated 9 segmentFTX
            , "3160" .@ repeated 9 segmentPCD
            , "3170" .@ repeated 99 (
              segmentGroup "71"
                [ "3180" .@ once segmentTCC
                , "3190" .@ maybeOnce segmentCUX
                , "3200" .@ maybeOnce segmentPRI
                , "3210" .@ maybeOnce segmentEQN
                , "3220" .@ maybeOnce segmentPCD
                , "3230" .@ repeated 9 segmentMOA
                , "3240" .@ repeated 9 segmentQTY
                ]
              )
            , "3250" .@ repeated 9 (
              segmentGroup "72"
                [ "3260" .@ once segmentNAD
                , "3270" .@ maybeOnce segmentDTM
                ]
              )
            , "3280" .@ repeated 99 (
              segmentGroup "73"
                [ "3290" .@ once segmentEQA
                , "3300" .@ maybeOnce segmentEQN
                ]
              )
            , "3310" .@ repeated 99 (
              segmentGroup "74"
                [ "3320" .@ once segmentDGS
                , "3330" .@ repeated 9 segmentFTX
                , "3340" .@ repeated 9 (
                  segmentGroup "75"
                    [ "3350" .@ once segmentCTA
                    , "3360" .@ repeated 9 segmentCOM
                    ]
                  )
                ]
              )
            ]
          )
        ]
      )
    , "3370" .@ once segmentUNT
    ]
