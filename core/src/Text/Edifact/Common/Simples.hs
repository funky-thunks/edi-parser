{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Common.Simples
  ( simple0001
  , simple0002
  , simple0004
  , simple0007
  , simple0008
  , simple0010
  , simple0014
  , simple0017
  , simple0019
  , simple0020
  , simple0022
  , simple0025
  , simple0026
  , simple0029
  , simple0031
  , simple0032
  , simple0035
  , simple0036
  , simple0042
  , simple0046
  , simple0051
  , simple0052
  , simple0054
  , simple0057
  , simple0062
  , simple0065
  , simple0068
  , simple0070
  , simple0073
  , simple0074
  , simple0080
  , simple0081
  , simple0133
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > 0001  Syntax identifier
-- > Repr: a4
simple0001 :: Parser Value
simple0001 = simple "0001" (alpha `exactly` 4)

-- | Derived from this specification:
--
-- > 0002  Syntax version number
-- > Repr: an1
simple0002 :: Parser Value
simple0002 = simple "0002" (alphaNumeric `exactly` 1)

-- | Derived from this specification:
--
-- > 0004  Interchange sender identification
-- > Repr: an..35
simple0004 :: Parser Value
simple0004 = simple "0004" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0007  Identification code qualifier
-- > Repr: an..4
simple0007 :: Parser Value
simple0007 = simple "0007" (alphaNumeric `upTo` 4)

-- | Derived from this specification:
--
-- > 0008  Interchange sender internal identification
-- > Repr: an..35
simple0008 :: Parser Value
simple0008 = simple "0008" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0010  Interchange recipient identification
-- > Repr: an..35
simple0010 :: Parser Value
simple0010 = simple "0010" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0014  Interchange recipient internal identification
-- > Repr: an..35
simple0014 :: Parser Value
simple0014 = simple "0014" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0017  Date
-- > Repr: n6
simple0017 :: Parser Value
simple0017 = simple "0017" (numeric `exactly` 6)

-- | Derived from this specification:
--
-- > 0019  Time
-- > Repr: n4
simple0019 :: Parser Value
simple0019 = simple "0019" (numeric `exactly` 4)

-- | Derived from this specification:
--
-- > 0020  Interchange control reference
-- > Repr: an..14
simple0020 :: Parser Value
simple0020 = simple "0020" (alphaNumeric `upTo` 14)

-- | Derived from this specification:
--
-- > 0022  Recipient reference/password
-- > Repr: an..14
simple0022 :: Parser Value
simple0022 = simple "0022" (alphaNumeric `upTo` 14)

-- | Derived from this specification:
--
-- > 0025  Recipient reference/password qualifier
-- > Repr: an2
simple0025 :: Parser Value
simple0025 = simple "0025" (alphaNumeric `exactly` 2)

-- | Derived from this specification:
--
-- > 0026  Application reference
-- > Repr: an..14
simple0026 :: Parser Value
simple0026 = simple "0026" (alphaNumeric `upTo` 14)

-- | Derived from this specification:
--
-- > 0029  Processing priority code
-- > Repr: a1
simple0029 :: Parser Value
simple0029 = simple "0029" (alphaNumeric `exactly` 1)

-- | Derived from this specification:
--
-- > 0031  Acknowledgement request
-- > Repr: n1
simple0031 :: Parser Value
simple0031 = simple "0031" (numeric `exactly` 1)

-- | Derived from this specification:
--
-- > 0032  Interchange agreement identifier
-- > Repr: an..35
simple0032 :: Parser Value
simple0032 = simple "0032" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0035  Test indicator
-- > Repr: n1
simple0035 :: Parser Value
simple0035 = simple "0035" (numeric `exactly` 1)

-- | Derived from this specification:
--
-- > 0036  Interchange control count
-- > Repr: n..6
simple0036 :: Parser Value
simple0036 = simple "0036" (numeric `upTo` 6)

-- | Derived from this specification:
--
-- > 0042  Interchange sender internal sub-identification
-- > Repr: an..35
simple0042 :: Parser Value
simple0042 = simple "0042" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0046  Interchange recipient internal sub-identification
-- > Repr: an..35
simple0046 :: Parser Value
simple0046 = simple "0046" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0051  Controlling agency
-- > Repr: an..2
simple0051 :: Parser Value
simple0051 = simple "0051" (alphaNumeric `upTo` 2)

-- | Derived from this specification:
--
-- > 0052  Message version number
-- > Repr: an..3
simple0052 :: Parser Value
simple0052 = simple "0052" (alphaNumeric `upTo` 3)

-- | Derived from this specification:
--
-- > 0054  Message release number
-- > Repr: an..3
simple0054 :: Parser Value
simple0054 = simple "0054" (alphaNumeric `upTo` 3)

-- | Derived from this specification:
--
-- > 0057  Association assigned code
-- > Repr: an..6
simple0057 :: Parser Value
simple0057 = simple "0057" (alphaNumeric `upTo` 6)

-- | Derived from this specification:
--
-- > 0062  MESSAGE REFERENCE NUMBER
-- > Repr: an..14
simple0062 :: Parser Value
simple0062 = simple "0062" (alphaNumeric `upTo` 14)

-- | Derived from this specification:
--
-- > 0065  Message type
-- > Repr: an..6
simple0065 :: Parser Value
simple0065 = simple "0065" (alphaNumeric `upTo` 6)

-- | Derived from this specification:
--
-- > 0068  COMMON ACCESS REFERENCE
-- > Repr: an..35
simple0068 :: Parser Value
simple0068 = simple "0068" (alphaNumeric `upTo` 35)

-- | Derived from this specification:
--
-- > 0070  Sequence of transfers
-- > Repr: n..2
simple0070 :: Parser Value
simple0070 = simple "0070" (numeric `upTo` 2)

-- | Derived from this specification:
--
-- > 0073  First and last transfer
-- > Repr: a1
simple0073 :: Parser Value
simple0073 = simple "0073" (alpha `exactly` 1)

-- | Derived from this specification:
--
-- > 0074  NUMBER OF SEGMENTS IN THE MESSAGE
-- > Repr: n..6
simple0074 :: Parser Value
simple0074 = simple "0074" (numeric `upTo` 6)

-- | Derived from this specification:
--
-- > 0080  Service code list directory version number
-- > Repr: an..6
simple0080 :: Parser Value
simple0080 = simple "0080" (alphaNumeric `upTo` 6)

-- | Derived from this specification:
--
-- > 0081  SECTION IDENTIFICATION
-- > Repr: a1
simple0081 :: Parser Value
simple0081 = simple "0081" (alpha `exactly` 1)

-- | Derived from this specification:
--
-- > 0133  Character encoding, coded
-- > Repr: an..3
simple0133 :: Parser Value
simple0133 = simple "0133" (alphaNumeric `upTo` 3)
