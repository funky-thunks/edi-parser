{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8351
  ( simple8351
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8351  Hazard code identification
-- >
-- >    Desc: Dangerous goods code.
-- >
-- >    Repr: an..7
-- >
-- >    Note: Use relevant code list.
simple8351 :: Parser Value
simple8351 = simple "8351" (alphaNumeric `upTo` 7)
