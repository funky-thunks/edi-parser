{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.TSR
  ( -- * Definition
    segmentTSR
    -- * Dependencies
  , compositeC233
  , compositeC536
  , compositeC537
  , compositeC703
  ) where

import           Text.Edifact.D96A.Composites (compositeC233, compositeC536,
                                               compositeC537, compositeC703)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       TSR    TRANSPORT SERVICE REQUIREMENTS
-- >
-- >       Function: To specify the contract and carriage conditions and
-- >                 service and priority requirements for the transport.
-- >
-- > 010   C536  CONTRACT AND CARRIAGE CONDITION                C
-- >       4065   Contract and carriage condition, coded        M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 020   C233  SERVICE                                        C
-- >       7273   Service requirement, coded                    M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7273   Service requirement, coded                    C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 030   C537  TRANSPORT PRIORITY                             C
-- >       4219   Transport priority, coded                     M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 040   C703  NATURE OF CARGO                                C
-- >       7085   Nature of cargo, coded                        M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'compositeC233', 'compositeC536', 'compositeC537', 'compositeC703'.
segmentTSR :: Parser Value
segmentTSR =
  segment "TSR"
    [ "010" .@ optional  compositeC536
    , "020" .@ optional  compositeC233
    , "030" .@ optional  compositeC537
    , "040" .@ optional  compositeC703
    ]
