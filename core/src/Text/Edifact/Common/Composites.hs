{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Common.Composites
  ( compositeS001
  , compositeS002
  , compositeS003
  , compositeS004
  , compositeS005
  , compositeS009
  , compositeS010
  ) where

import           Text.Edifact.Common.Simples (simple0001, simple0002,
                                              simple0004, simple0007,
                                              simple0008, simple0010,
                                              simple0014, simple0017,
                                              simple0019, simple0022,
                                              simple0025, simple0042,
                                              simple0046, simple0051,
                                              simple0052, simple0054,
                                              simple0057, simple0065,
                                              simple0070, simple0073,
                                              simple0080, simple0133)

import           Text.Edifact.Parsing
import           Text.Edifact.Types          (Value)

-- | Derived from this specification:
--
-- >   010   0001   Syntax identifier                                  M  a4
-- >   020   0002   Syntax version number                              M  an1
-- >   030   0080   Service code list directory version number         C  an..6
-- >   040   0133   Character encoding, coded                          C  an..3
--
-- Dependencies: 'simple0001', 'simple0002', 'simple0080', 'simple0133'.
compositeS001 :: Parser Value
compositeS001 =
  composite "S001"
    [ "010" .@ mandatory simple0001
    , "020" .@ mandatory simple0002
    , "030" .@ optional  simple0080
    , "040" .@ optional  simple0133
    ]

-- | Derived from this specification:
--
-- >   010   0004   Interchange sender identification                  M  an..35
-- >   020   0007   Identification code qualifier                      C  an..4
-- >   030   0008   Interchange sender internal identification         C  an..35
-- >   040   0042   Interchange sender internal sub-identification     C  an..35
--
-- Dependencies: 'simple0004', 'simple0007', 'simple0008', 'simple0042'.
compositeS002 :: Parser Value
compositeS002 =
  composite "S002"
    [ "010" .@ mandatory simple0004
    , "020" .@ optional  simple0007
    , "030" .@ optional  simple0008
    , "040" .@ optional  simple0042
    ]

-- | Derived from this specification:
--
-- >   010   0010   Interchange recipient identification               M  an..35
-- >   020   0007   Identification code qualifier                      C  an..4
-- >   030   0014   Interchange recipient internal identification      C  an..35
-- >   040   0046   Interchange recipient internal sub-identification  C  an..35
--
-- Dependencies: 'simple0007', 'simple0010', 'simple0014', 'simple0046'.
compositeS003 :: Parser Value
compositeS003 =
  composite "S003"
    [ "010" .@ mandatory simple0010
    , "020" .@ optional  simple0007
    , "030" .@ optional  simple0014
    , "040" .@ optional  simple0046
    ]

-- | Derived from this specification:
--
-- >   010   0017   Date                                               M  n6
-- >   020   0019   Time                                               M  n4
--
-- Dependencies: 'simple0017', 'simple0019'.
compositeS004 :: Parser Value
compositeS004 =
  composite "S004"
    [ "010" .@ mandatory simple0017
    , "020" .@ mandatory simple0019
    ]

-- | Derived from this specification:
--
-- >   010   0022   Recipient reference/password                       M  an..14
-- >   020   0025   Recipient reference/password qualifier             C  an2
--
-- Dependencies: 'simple0022', 'simple0025'.
compositeS005 :: Parser Value
compositeS005 =
  composite "S005"
    [ "010" .@ mandatory simple0022
    , "020" .@ optional  simple0025
    ]

-- | Derived from this specification:
--
-- >   010   0065   Message type                                       M  an..6
-- >   020   0052   Message version number                             M  an..3
-- >   030   0054   Message release number                             M  an..3
-- >   040   0051   Controlling agency                                 M  an..2
-- >   050   0057   Association assigned code                          C  an..6
--
-- Dependencies: 'simple0051', 'simple0052', 'simple0054', 'simple0057', 'simple0065'.
compositeS009 :: Parser Value
compositeS009 =
  composite "S009"
    [ "010" .@ mandatory simple0065
    , "020" .@ mandatory simple0052
    , "030" .@ mandatory simple0054
    , "040" .@ mandatory simple0051
    , "050" .@ optional  simple0057
    ]

-- | Derived from this specification:
--
-- >   010   0070   Sequence of transfers                              M  n..2
-- >   020   0073   First and last transfer                            C  a1
--
-- Dependencies: 'simple0070', 'simple0073'.
compositeS010 :: Parser Value
compositeS010 =
  composite "S010"
    [ "010" .@ mandatory simple0070
    , "020" .@ optional  simple0073
    ]
