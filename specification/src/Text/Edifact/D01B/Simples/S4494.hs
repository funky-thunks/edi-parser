{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4494
  ( simple4494
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4494  Insurance cover description                             [B]
-- >
-- >      Desc: Free form description of the insurance cover.
-- >
-- >      Repr: an..35
simple4494 :: Parser Value
simple4494 = simple "4494" (alphaNumeric `upTo` 35)
