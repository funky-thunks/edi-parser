{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.TDT
  ( -- * Definition
    segmentTDT
    -- * Dependencies
  , compositeC040
  , compositeC220
  , compositeC222
  , compositeC228
  , compositeC401
  , simple8028
  , simple8051
  , simple8101
  , simple8281
  ) where

import           Text.Edifact.D96A.Composites (compositeC040, compositeC220,
                                               compositeC222, compositeC228,
                                               compositeC401)
import           Text.Edifact.D96A.Simples    (simple8028, simple8051,
                                               simple8101, simple8281)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       TDT    DETAILS OF TRANSPORT
-- >
-- >       Function: To specify the transport details such as mode of
-- >                 transport, means of transport, its conveyance
-- >                 reference number and the identification of the means
-- >                 of transport.
-- >                 The segment may be pointed to by the TPL segment.
-- >
-- > 010   8051  TRANSPORT STAGE QUALIFIER                      M  an..3
-- >
-- > 020   8028  CONVEYANCE REFERENCE NUMBER                    C  an..17
-- >
-- > 030   C220  MODE OF TRANSPORT                              C
-- >       8067   Mode of transport, coded                      C  an..3
-- >       8066   Mode of transport                             C  an..17
-- >
-- > 040   C228  TRANSPORT MEANS                                C
-- >       8179   Type of means of transport identification     C  an..8
-- >       8178   Type of means of transport                    C  an..17
-- >
-- > 050   C040  CARRIER                                        C
-- >       3127   Carrier identification                        C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       3128   Carrier name                                  C  an..35
-- >
-- > 060   8101  TRANSIT DIRECTION, CODED                       C  an..3
-- >
-- > 070   C401  EXCESS TRANSPORTATION INFORMATION              C
-- >       8457   Excess transportation reason, coded           M  an..3
-- >       8459   Excess transportation responsibility, coded   M  an..3
-- >       7130   Customer authorization number                 C  an..17
-- >
-- > 080   C222  TRANSPORT IDENTIFICATION                       C
-- >       8213   Id. of means of transport identification      C  an..9
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       8212   Id. of the means of transport                 C  an..35
-- >       8453   Nationality of means of transport, coded      C  an..3
-- >
-- > 090   8281  TRANSPORT OWNERSHIP, CODED                     C  an..3
--
-- Dependencies: 'compositeC040', 'compositeC220', 'compositeC222', 'compositeC228', 'compositeC401', 'simple8028', 'simple8051', 'simple8101', 'simple8281'.
segmentTDT :: Parser Value
segmentTDT =
  segment "TDT"
    [ "010" .@ mandatory simple8051
    , "020" .@ optional  simple8028
    , "030" .@ optional  compositeC220
    , "040" .@ optional  compositeC228
    , "050" .@ optional  compositeC040
    , "060" .@ optional  simple8101
    , "070" .@ optional  compositeC401
    , "080" .@ optional  compositeC222
    , "090" .@ optional  simple8281
    ]
