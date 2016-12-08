{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C205
  ( -- * Definition
    compositeC205
    -- * Dependencies
  , simple8078
  , simple8092
  , simple8351
  ) where

import           Text.Edifact.D96A.Simples (simple8078, simple8092, simple8351)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C205  HAZARD CODE
-- >
-- >       Desc: The identification of the dangerous goods in code.
-- >
-- > 010   8351   Hazard code identification                    M  an..7
-- > 020   8078   Hazard substance/item/page number             C  an..7
-- > 030   8092   Hazard code version number                    C  an..10
--
-- Dependencies: 'simple8078', 'simple8092', 'simple8351'.
compositeC205 :: Parser Value
compositeC205 =
  composite "C205"
    [ "010" .@ mandatory simple8351
    , "020" .@ optional  simple8078
    , "030" .@ optional  simple8092
    ]
