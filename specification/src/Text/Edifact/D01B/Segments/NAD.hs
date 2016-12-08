{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.NAD
  ( -- * Definition
    segmentNAD
    -- * Dependencies
  , compositeC058
  , compositeC059
  , compositeC080
  , compositeC082
  , compositeC819
  , simple3035
  , simple3164
  , simple3207
  , simple3251
  ) where

import           Text.Edifact.D01B.Composites (compositeC058, compositeC059,
                                               compositeC080, compositeC082,
                                               compositeC819)
import           Text.Edifact.D01B.Simples    (simple3035, simple3164,
                                               simple3207, simple3251)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        NAD  NAME AND ADDRESS
-- >
-- >        Function: To specify the name/address and their related
-- >                  function, either by C082 only and/or
-- >                  unstructured by C058 or structured by C080 thru
-- >                  3207.
-- >
-- > 010    3035 PARTY FUNCTION CODE QUALIFIER              M    1 an..3
-- >
-- > 020    C082 PARTY IDENTIFICATION DETAILS               C    1
-- >        3039  Party identifier                          M      an..35
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 030    C058 NAME AND ADDRESS                           C    1
-- >        3124  Name and address description              M      an..35
-- >        3124  Name and address description              C      an..35
-- >        3124  Name and address description              C      an..35
-- >        3124  Name and address description              C      an..35
-- >        3124  Name and address description              C      an..35
-- >
-- > 040    C080 PARTY NAME                                 C    1
-- >        3036  Party name                                M      an..35
-- >        3036  Party name                                C      an..35
-- >        3036  Party name                                C      an..35
-- >        3036  Party name                                C      an..35
-- >        3036  Party name                                C      an..35
-- >        3045  Party name format code                    C      an..3
-- >
-- > 050    C059 STREET                                     C    1
-- >        3042  Street and number or post office box
-- >              identifier                                M      an..35
-- >        3042  Street and number or post office box
-- >              identifier                                C      an..35
-- >        3042  Street and number or post office box
-- >              identifier                                C      an..35
-- >        3042  Street and number or post office box
-- >              identifier                                C      an..35
-- >
-- > 060    3164 CITY NAME                                  C    1 an..35
-- >
-- > 070    C819 COUNTRY SUB-ENTITY DETAILS                 C    1
-- >        3229  Country sub-entity name code              C      an..9
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3228  Country sub-entity name                   C      an..70
-- >
-- > 080    3251 POSTAL IDENTIFICATION CODE                 C    1 an..17
-- >
-- > 090    3207 COUNTRY NAME CODE                          C    1 an..3
--
-- Dependencies: 'compositeC058', 'compositeC059', 'compositeC080', 'compositeC082', 'compositeC819', 'simple3035', 'simple3164', 'simple3207', 'simple3251'.
segmentNAD :: Parser Value
segmentNAD =
  segment "NAD"
    [ "010" .@ mandatory simple3035
    , "020" .@ optional  compositeC082
    , "030" .@ optional  compositeC058
    , "040" .@ optional  compositeC080
    , "050" .@ optional  compositeC059
    , "060" .@ optional  simple3164
    , "070" .@ optional  compositeC819
    , "080" .@ optional  simple3251
    , "090" .@ optional  simple3207
    ]
