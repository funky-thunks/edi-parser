{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8028
  ( simple8028
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8028  Conveyance reference number
-- >
-- >    Desc: Unique reference given by the carrier to a certain journey or
-- >          departure of a means of transport (generic term).
-- >
-- >    Repr: an..17
simple8028 :: Parser Value
simple8028 = simple "8028" (alphaNumeric `upTo` 17)
