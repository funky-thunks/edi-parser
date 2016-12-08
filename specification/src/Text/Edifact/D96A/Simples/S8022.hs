{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8022
  ( simple8022
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8022  Freight and charges
-- >
-- >    Desc: Plain language statement describing freight and other
-- >          charges.
-- >
-- >    Repr: an..26
simple8022 :: Parser Value
simple8022 = simple "8022" (alphaNumeric `upTo` 26)
