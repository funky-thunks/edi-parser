{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3228
  ( simple3228
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3228  Country sub-entity name                                 [C]
-- >
-- >      Desc: Name of a country sub-entity.
-- >
-- >      Repr: an..70
simple3228 :: Parser Value
simple3228 = simple "3228" (alphaNumeric `upTo` 70)
