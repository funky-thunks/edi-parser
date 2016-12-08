{-# LANGUAGE OverloadedStrings #-}

module Edifact
  ( suite
  ) where

import           Text.Edifact.Common.Segments
import           Text.Edifact.D96A
import           Text.Edifact.Parsing

import           Data.Text                      (Text, unpack)
import           Text.Parsec                    (eof)

import           Test.Framework
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     ((@?=))

suite :: Test
suite =
  testGroup "examples"
    [ canParse simple1153    "AAV"
    , canParse simple1154    ""
    , canParse simple1156    "C"
    , canParse compositeC506 "AAV"
    , canParse compositeC506 "AAV::C"
    , canParse segmentRFF    "RFF+AAV'"
    , canParse segmentRFF    "RFF+AAV::C'"

    , canParse segmentUNB "UNB+UNOA:1+US::US+50138::THEM+140531:0305+001934++ORDERS'"
    , canParse segmentUNH "UNH+1+ORDERS:91:2:UN'"
    , canParse segmentRFF "RFF+CT:EUA01349'"
    , canParse segmentRFF "RFF+AAV::C'"
    , canParse segmentNAD "NAD+BY++OUR NAME PLC::::+++++EW4 34J'"
    , canParse segmentCTA "CTA+PD'"
    , canParse segmentCTA "CTA+OC+:A.SURNAME'"
    , canParse segmentCOM "COM+2407:EX'"
    , canParse segmentCTA "CTA+TI+:B.BROWN'"
    , canParse segmentCOM "COM+0:EX'"
    , canParse segmentCTA "CTA+SU'"
    , canParse segmentUNT "UNT+15+1'"
    , canParse segmentUNZ "UNZ+1+001934'"

    , canParse segmentUNA "UNA:+.? '"
    , canParse segmentUNB "UNB+IATB:1+6XPPC+LHPPC+940101:0950+1'"
    , canParse segmentUNH "UNH+1+PAORES:93:1:IA'"
    , canParse segmentUNT "UNT+13+1'"
    , canParse segmentUNZ "UNZ+1+1'"

      -- Examples from:
      -- https://www.adient.com/-/media/adient/shared/suppliers/supplier-expectations/supply-chain-management-emea-docs/adient_edi-implementation-guide---desadv-un-d96a---updated-logo.pdf
    , canParse segmentUNB "UNB+UNOA:3+SENDER+O0013007096JCIEUAG::0711+060206:1708+183'"
    , canParse segmentUNH "UNH+LF001+DESADV:D:96A:UN'"
    , canParse segmentBGM "BGM+351+DES58765+9'"
    , canParse segmentDTM "DTM+137:200506011400:203'"
    , canParse segmentDTM "DTM+11:200506011200:203'"
    , canParse segmentMEA "MEA+AAX+AAD+KGM:47'"
    , canParse segmentNAD "NAD+CZ+32169::92++CONSIGNOR NAME'"
    , canParse segmentNAD "NAD+SE+876543210::92++SELLER NAME'"
    , canParse segmentNAD "NAD+CN+1801::92++CONSIGNEE NAME'"
    , canParse segmentNAD "NAD+CA+18010::92++CARRIER NAME'"
    , canParse segmentLOC "LOC+11+ABC123'"
    , canParse segmentRFF "RFF+ADE:12332'"
    , canParse segmentTOD "TOD+5++EXW'"
    , canParse segmentTDT "TDT+12++30'"
    , canParse segmentEQD "EQD+TE+XYZ123456'"
    , canParse segmentQTY "QTY+52:400:PCE'"
    , canParse segmentPCI "PCI+17'"
    , canParse segmentRFF "RFF+AAT:00123477'"
    , canParse segmentPIA "PIA+1+CR153:SA'"
    , canParse segmentQTY "QTY+3:1200:PCE'"
    , canParse segmentQTY "QTY+12:400:PCE'"
    , canParse segmentRFF "RFF+ON:51523'"
    , canParse segmentUNT "UNT+45+LF001'"

    , canParse segmentUNB "UNB+UNOA:4+FMFOOBA:ZZZ+FLFOOBA:OG+190515:0557+000000008'"
    , canParse segmentUNH "UNH+0002+IFCSUM:D:96A:UN'"
    , canParse segmentBGM "BGM+787::86+01234567+9'"
    , canParse segmentMOA "MOA+7::EUR'"
    , canParse segmentCNT "CNT+7:359.741:KGM'"
    , canParse segmentRFF "RFF+AFC:01234567'"
    , canParse segmentTDT "TDT+20+++31+0012321001:172::SOME COMPANY+SB'"
    , canParse segmentNAD "NAD+CZ+FR01++SHIPPER NAME+ RUE SOMEWHERE+CITY+FRA+01000'"
    , canParse segmentCTA "CTA+IC+Some Contact:Some Name'"
    , canParse segmentCOM "COM+some.email@example.com:EM'"
    , canParse segmentEQD "EQD+TE++E34T'"
    , canParse segmentCNI "CNI+++1'"
    , canParse segmentDTM "DTM+37:201904040000:203'"
    , canParse segmentDTM "DTM+38:201904082358:203'"
    , canParse segmentCNT "CNT+10:1'"
    , canParse segmentCNT "CNT+7:359.74:KGM'"
    , canParse segmentCNT "CNT+15:3.38:KGM'"
    , canParse segmentCNT "CNT+9:163:SV'"
    , canParse segmentNAD "NAD+SF+FR01++SHIPPER NAME+ RUE SOMEWHERE+CITY+FRA+01000'"
    , canParse segmentGID "GID+1+163::::SV'"
    , canParse segmentPIA "PIA+1+0212455321:TG'"
    , canParse segmentFTX "FTX+AAA+++Default'"
    , canParse segmentMEA "MEA+WT+G+KGM:359.741'"
    , canParse segmentMEA "MEA+VOL+ACP+MTQ:3.384'"
    , canParse segmentRFF "RFF+ACD:0123432105'"
    , canParse segmentTCC "TCC+Some Info:ZZZ'"
    , canParse segmentQTY "QTY+107:2.000000'"
    , canParse segmentCNI "CNI+++2'"
    , canParse segmentDTM "DTM+64:201904080001:203'"
    , canParse segmentDTM "DTM+63:201904082359:203'"
    , canParse segmentCNT "CNT+10:1'"
    , canParse segmentCNT "CNT+7:359.74:KGM'"
    , canParse segmentCNT "CNT+15:3.38:KGM'"
    , canParse segmentCNT "CNT+9:163:SV'"
    , canParse segmentNAD "NAD+ST+2000000000++SOME ADDRESS+ ZI SOMEWHERE+CITY+FRA+01000'"
    , canParse segmentGID "GID+1+163::::SV'"
    , canParse segmentPIA "PIA+1+0212455321:TG'"
    , canParse segmentFTX "FTX+AAA+++Default'"
    , canParse segmentMEA "MEA+WT+G+KGM:359.741'"
    , canParse segmentMEA "MEA+VOL+ACP+MTQ:3.384'"
    , canParse segmentRFF "RFF+ACD:012343210'"
    , canParse segmentTCC "TCC+Some Info:ZZZ'"
    , canParse segmentQTY "QTY+107:2.000000'"
    , canParse segmentUNT "UNT+43+0002'"
    , canParse segmentUNZ "UNZ+1+000000008'"

    , canParse messageIFCSUM "UNH+0002+IFCSUM:D:96A:UN'BGM+787::86+01234567+9'MOA+7::EUR'CNT+7:359.741:KGM'RFF+AFC:01234567'TDT+20+++31+0012332100:172::SOME COMPANY+SB'NAD+CZ+FR01++SHIPPER NAME+ RUE SOMEWHERE+CITY+FRA+01000'CTA+IC+Some Contact:Some Name'COM+some.email@example.com:EM'EQD+TE++E34T'CNI+++1'DTM+37:201904040000:203'DTM+38:201904082358:203'CNT+10:1'CNT+7:359.74:KGM'CNT+15:3.38:KGM'CNT+9:163:SV'NAD+SF+FR01++SHIPPER NAME+ RUE SOMEWHERE+CITY+FRA+01000'GID+1+163::::SV'PIA+1+0212455321:TG'FTX+AAA+++Default'MEA+WT+G+KGM:359.741'MEA+VOL+ACP+MTQ:3.384'RFF+ACD:0123432105'TCC+Some Info:ZZZ'QTY+107:2.000000'CNI+++2'DTM+64:201904080001:203'DTM+63:201904082359:203'CNT+10:1'CNT+7:359.74:KGM'CNT+15:3.38:KGM'CNT+9:163:SV'NAD+ST+2000000000++SOME ADDRESS+ ZI SOMEWHERE+CITY+FRA+01000'GID+1+163::::SV'PIA+1+0212455321:TG'FTX+AAA+++Default'MEA+WT+G+KGM:359.741'MEA+VOL+ACP+MTQ:3.384'RFF+ACD:012343210'TCC+Some Info:ZZZ'QTY+107:2.000000'UNT+43+0002'"
    ]

canParse :: Parser a -> Text -> Test
canParse p t =
  let title = "\"" <> unpack t <> "\""
  in testCase title (() <$ parse (p <* eof) t @?= Right ())
