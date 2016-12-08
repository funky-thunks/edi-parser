{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.NAD
  ( -- * Definition
    segmentNAD
    -- * Dependencies
  , compositeC058
  , compositeC059
  , compositeC080
  , compositeC082
  , simple3035
  , simple3164
  , simple3207
  , simple3229
  , simple3251
  ) where

import           Text.Edifact.D96A.Composites (compositeC058, compositeC059,
                                               compositeC080, compositeC082)
import           Text.Edifact.D96A.Simples    (simple3035, simple3164,
                                               simple3207, simple3229,
                                               simple3251)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       NAD    NAME AND ADDRESS
-- >
-- >       Function: To specify the name/address and their related
-- >                 function, either by CO82 only and/or unstructured by
-- >                 CO58 or structured by CO80 thru 3207.
-- >
-- > 010   3035  PARTY QUALIFIER                                M  an..3
-- >
-- > 020   C082  PARTY IDENTIFICATION DETAILS                   C
-- >       3039   Party id. identification                      M  an..35
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 030   C058  NAME AND ADDRESS                               C
-- >       3124   Name and address line                         M  an..35
-- >       3124   Name and address line                         C  an..35
-- >       3124   Name and address line                         C  an..35
-- >       3124   Name and address line                         C  an..35
-- >       3124   Name and address line                         C  an..35
-- >
-- > 040   C080  PARTY NAME                                     C
-- >       3036   Party name                                    M  an..35
-- >       3036   Party name                                    C  an..35
-- >       3036   Party name                                    C  an..35
-- >       3036   Party name                                    C  an..35
-- >       3036   Party name                                    C  an..35
-- >       3045   Party name format, coded                      C  an..3
-- >
-- > 050   C059  STREET                                         C
-- >       3042   Street and number/p.o. box                    M  an..35
-- >       3042   Street and number/p.o. box                    C  an..35
-- >       3042   Street and number/p.o. box                    C  an..35
-- >       3042   Street and number/p.o. box                    C  an..35
-- >
-- > 060   3164  CITY NAME                                      C  an..35
-- >
-- > 070   3229  COUNTRY SUB-ENTITY IDENTIFICATION              C  an..9
-- >
-- > 080   3251  POSTCODE IDENTIFICATION                        C  an..9
-- >
-- > 090   3207  COUNTRY, CODED                                 C  an..3
--
-- Dependencies: 'compositeC058', 'compositeC059', 'compositeC080', 'compositeC082', 'simple3035', 'simple3164', 'simple3207', 'simple3229', 'simple3251'.
segmentNAD :: Parser Value
segmentNAD =
  segment "NAD"
    [ "010" .@ mandatory simple3035
    , "020" .@ optional  compositeC082
    , "030" .@ optional  compositeC058
    , "040" .@ optional  compositeC080
    , "050" .@ optional  compositeC059
    , "060" .@ optional  simple3164
    , "070" .@ optional  simple3229
    , "080" .@ optional  simple3251
    , "090" .@ optional  simple3207
    ]
