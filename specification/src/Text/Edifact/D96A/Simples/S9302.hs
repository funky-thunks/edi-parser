{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9302
  ( simple9302
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    9302  Sealing party
-- >
-- >    Desc: Clear text, representing the name of the issuer of the seal
-- >          number.
-- >
-- >    Repr: an..35
simple9302 :: Parser Value
simple9302 = simple "9302" (alphaNumeric `upTo` 35)
