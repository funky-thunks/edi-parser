{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7357
  ( simple7357
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7357  Commodity/rate identification
-- >
-- >    Desc: Code identifying goods for Customs, transport or statistical
-- >          purposes (generic term).
-- >
-- >    Repr: an..18
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple7357 :: Parser Value
simple7357 = simple "7357" (alphaNumeric `upTo` 18)
