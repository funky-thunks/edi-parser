{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4000
  ( simple4000
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4000  Reference version identifier                            [C]
-- >
-- >      Desc: To identify the version of a reference.
-- >
-- >      Repr: an..35
simple4000 :: Parser Value
simple4000 = simple "4000" (alphaNumeric `upTo` 35)
