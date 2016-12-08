{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4294
  ( simple4294
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    4294  Change reason
-- >
-- >    Desc: Description of the reason for a change.
-- >
-- >    Repr: an..35
simple4294 :: Parser Value
simple4294 = simple "4294" (alphaNumeric `upTo` 35)
