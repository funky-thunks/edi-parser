{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.EQD
  ( -- * Definition
    segmentEQD
    -- * Dependencies
  , compositeC224
  , compositeC237
  , simple8053
  , simple8077
  , simple8169
  , simple8249
  ) where

import           Text.Edifact.D96A.Composites (compositeC224, compositeC237)
import           Text.Edifact.D96A.Simples    (simple8053, simple8077,
                                               simple8169, simple8249)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       EQD    EQUIPMENT DETAILS
-- >
-- >       Function: To identify a unit of equipment.
-- >
-- > 010   8053  EQUIPMENT QUALIFIER                            M  an..3
-- >
-- > 020   C237  EQUIPMENT IDENTIFICATION                       C
-- >       8260   Equipment identification number               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       3207   Country, coded                                C  an..3
-- >
-- > 030   C224  EQUIPMENT SIZE AND TYPE                        C
-- >       8155   Equipment size and type identification        C  an..10
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       8154   Equipment size and type                       C  an..35
-- >
-- > 040   8077  EQUIPMENT SUPPLIER, CODED                      C  an..3
-- >
-- > 050   8249  EQUIPMENT STATUS, CODED                        C  an..3
-- >
-- > 060   8169  FULL/EMPTY INDICATOR, CODED                    C  an..3
--
-- Dependencies: 'compositeC224', 'compositeC237', 'simple8053', 'simple8077', 'simple8169', 'simple8249'.
segmentEQD :: Parser Value
segmentEQD =
  segment "EQD"
    [ "010" .@ mandatory simple8053
    , "020" .@ optional  compositeC237
    , "030" .@ optional  compositeC224
    , "040" .@ optional  simple8077
    , "050" .@ optional  simple8249
    , "060" .@ optional  simple8169
    ]
