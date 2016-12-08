{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Common.Segments.UNB
  ( segmentUNB
  ) where

import           Text.Edifact.Common.Composites (compositeS001, compositeS002,
                                                 compositeS003, compositeS004,
                                                 compositeS005)
import           Text.Edifact.Common.Simples    (simple0020, simple0026,
                                                 simple0029, simple0031,
                                                 simple0032, simple0035)

import           Text.Edifact.Parsing
import           Text.Edifact.Types             (Value)

-- | Derived from this specification:
--
-- > Pos          Segment                                             M/C  Repeat  Repr.  Notes
-- > 010    S001  SYNTAX IDENTIFIER                                  M    1
-- >        0001   Syntax identifier                                 M            a4
-- >        0002   Syntax version number                             M            an1
-- >        0080   Service code list directory version number        C            an..6
-- >        0133   Character encoding, coded                         C            an..3
-- > 020    S002  INTERCHANGE SENDER                                 M    1
-- >        0004   Interchange sender identification                 M            an..35
-- >        0007   Identification code qualifier                     C            an..4
-- >        0008   Interchange sender internal identification        C            an..35
-- >        0042   Interchange sender internal sub-identification    C            an..35
-- > 030    S003  INTERCHANGE RECIPIENT                              M    1
-- >        0010   Interchange recipient identification              M            an..35
-- >        0007   Identification code qualifier                     C            an..4
-- >        0014   Interchange recipient internal identification     C            an..35
-- >        0046   Interchange recipient internal sub-identification C            an..35
-- > 040    S004  DATE AND TIME OF PREPARATION                       M    1
-- >        0017   Date                                              M            n8
-- >        0019   Time                                              M            n4
-- > 050    0020  Interchange control reference                      M    1       an..14
-- > 060    S005  RECIPIENT'S REFERENCE/PASSWORD DETAILS             C    1
-- >        0022   Recipient reference/password                      M            an..14
-- >        0025   Recipient reference/password qualifier            C            an2
-- > 070    0026  Application reference                              C    1       an..14
-- > 080    0029  Processing priority code                           C    1       a1
-- > 090    0031  Acknowledgement request                            C    1       n1
-- > 100    0032  Interchange agreement identifier                   C    1       an..35
-- > 110    0035  Test indicator                                     C    1       n1
--
-- Dependencies: 'compositeS001', 'compositeS002', 'compositeS003', 'compositeS004', 'compositeS005', 'simple0020', 'simple0026', 'simple0029', 'simple0031', 'simple0032', 'simple0035'.
segmentUNB :: Parser Value
segmentUNB =
  segment "UNB"
    [ "010" .@ mandatory compositeS001
    , "020" .@ mandatory compositeS002
    , "030" .@ mandatory compositeS003
    , "040" .@ mandatory compositeS004
    , "050" .@ mandatory simple0020
    , "060" .@ optional  compositeS005
    , "070" .@ optional  simple0026
    , "080" .@ optional  simple0029
    , "090" .@ optional  simple0031
    , "100" .@ optional  simple0032
    , "110" .@ optional  simple0035
    ]
