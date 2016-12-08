{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.TPL
  ( -- * Definition
    segmentTPL
    -- * Dependencies
  , compositeC222
  ) where

import           Text.Edifact.D96A.Composites (compositeC222)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       TPL    TRANSPORT PLACEMENT
-- >
-- >       Function: To specify placement of goods or equipment in relation
-- >                 to the transport used. The segment serves as a pointer
-- >                 to the TDT segment group.
-- >
-- > 010   C222  TRANSPORT IDENTIFICATION                       M
-- >       8213   Id. of means of transport identification      C  an..9
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       8212   Id. of the means of transport                 C  an..35
-- >       8453   Nationality of means of transport, coded      C  an..3
--
-- Dependencies: 'compositeC222'.
segmentTPL :: Parser Value
segmentTPL =
  segment "TPL"
    [ "010" .@ mandatory compositeC222
    ]
