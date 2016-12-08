{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S9308
  ( simple9308
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      9308  Seal identifier                                         [B]
-- >
-- >      Desc: To identify a seal.
-- >
-- >      Repr: an..35
simple9308 :: Parser Value
simple9308 = simple "9308" (alphaNumeric `upTo` 35)
