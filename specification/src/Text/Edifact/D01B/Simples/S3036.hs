{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3036
  ( simple3036
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3036  Party name                                              [C]
-- >
-- >      Desc: Name of a party.
-- >
-- >      Repr: an..35
simple3036 :: Parser Value
simple3036 = simple "3036" (alphaNumeric `upTo` 35)
