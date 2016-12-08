{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.STS
  ( -- * Definition
    segmentSTS
    -- * Dependencies
  , compositeC555
  , compositeC556
  , compositeC601
  ) where

import           Text.Edifact.D96A.Composites (compositeC555, compositeC556,
                                               compositeC601)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       STS    STATUS
-- >
-- >       Function: To specify the type of industry sector/application to
-- >                 which this segment refers, giving the status and
-- >                 status reason relevant to conducting business and/or
-- >                 services.
-- >
-- > 010   C601  STATUS TYPE                                    C
-- >       9015   Status type, coded                            M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 020   C555  STATUS EVENT                                   C
-- >       9011   Status event, coded                           M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9010   Status event                                  C  an..35
-- >
-- > 030   C556  STATUS REASON                                  C
-- >       9013   Status reason, coded                          M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9012   Status reason                                 C  an..35
-- >
-- > 040   C556  STATUS REASON                                  C
-- >       9013   Status reason, coded                          M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9012   Status reason                                 C  an..35
-- >
-- > 050   C556  STATUS REASON                                  C
-- >       9013   Status reason, coded                          M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9012   Status reason                                 C  an..35
-- >
-- > 060   C556  STATUS REASON                                  C
-- >       9013   Status reason, coded                          M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9012   Status reason                                 C  an..35
-- >
-- > 070   C556  STATUS REASON                                  C
-- >       9013   Status reason, coded                          M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       9012   Status reason                                 C  an..35
--
-- Dependencies: 'compositeC555', 'compositeC556', 'compositeC601'.
segmentSTS :: Parser Value
segmentSTS =
  segment "STS"
    [ "010" .@ optional  compositeC601
    , "020" .@ optional  compositeC555
    , "030" .@ optional  compositeC556
    , "040" .@ optional  compositeC556
    , "050" .@ optional  compositeC556
    , "060" .@ optional  compositeC556
    , "070" .@ optional  compositeC556
    ]
