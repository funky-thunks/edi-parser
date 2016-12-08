{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4497
  ( simple4497
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4497  Insurance cover type code                               [C]
-- >
-- >      Desc: Code specifying the meaning of the insurance cover.
-- >
-- >      Repr: an..3
simple4497 :: Parser Value
simple4497 = simple "4497" (alphaNumeric `upTo` 3)
