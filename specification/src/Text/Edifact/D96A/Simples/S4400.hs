{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4400
  ( simple4400
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    4400  Instruction
-- >
-- >    Desc: Description of an instruction.
-- >
-- >    Repr: an..35
simple4400 :: Parser Value
simple4400 = simple "4400" (alphaNumeric `upTo` 35)
