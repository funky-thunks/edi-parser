{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4495
  ( simple4495
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4495  Insurance cover description code                        [B]
-- >
-- >      Desc: Code specifying the insurance cover.
-- >
-- >      Repr: an..17
simple4495 :: Parser Value
simple4495 = simple "4495" (alphaNumeric `upTo` 17)
