{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C401
  ( -- * Definition
    compositeC401
    -- * Dependencies
  , simple7130
  , simple8457
  , simple8459
  ) where

import           Text.Edifact.D96A.Simples (simple7130, simple8457, simple8459)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C401  EXCESS TRANSPORTATION INFORMATION
-- >
-- >       Desc: To provide details of reason for, and responsibility for,
-- >             use of transportation other than normally utilized.
-- >
-- > 010   8457   Excess transportation reason, coded           M  an..3
-- > 020   8459   Excess transportation responsibility, coded   M  an..3
-- > 030   7130   Customer authorization number                 C  an..17
--
-- Dependencies: 'simple7130', 'simple8457', 'simple8459'.
compositeC401 :: Parser Value
compositeC401 =
  composite "C401"
    [ "010" .@ mandatory simple8457
    , "020" .@ mandatory simple8459
    , "030" .@ optional  simple7130
    ]
