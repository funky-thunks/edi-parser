{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4078
  ( simple4078
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    4078  Handling instructions
-- >
-- >    Desc: Instructions on how specified goods, packages or containers
-- >          should be handled.
-- >
-- >    Repr: an..70
simple4078 :: Parser Value
simple4078 = simple "4078" (alphaNumeric `upTo` 70)
