{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8255
  ( simple8255
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8255  Packing instruction, coded
-- >
-- >    Desc: Code defining the quantity and the type of package in which a
-- >          product is allowed to be shipped in a passenger or freight
-- >          aircraft.
-- >
-- >    Repr: an..3
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple8255 :: Parser Value
simple8255 = simple "8255" (alphaNumeric `upTo` 3)
