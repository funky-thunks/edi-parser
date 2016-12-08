{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.PCD
  ( -- * Definition
    segmentPCD
    -- * Dependencies
  , compositeC501
  ) where

import           Text.Edifact.D96A.Composites (compositeC501)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       PCD    PERCENTAGE DETAILS
-- >
-- >       Function: To specify percentage information.
-- >
-- > 010   C501  PERCENTAGE DETAILS                             M
-- >       5245   Percentage qualifier                          M  an..3
-- >       5482   Percentage                                    C  n..10
-- >       5249   Percentage basis, coded                       C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'compositeC501'.
segmentPCD :: Parser Value
segmentPCD =
  segment "PCD"
    [ "010" .@ mandatory compositeC501
    ]
