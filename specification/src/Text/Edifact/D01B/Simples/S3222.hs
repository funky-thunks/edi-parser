{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3222
  ( simple3222
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3222  First related location name                             [B]
-- >
-- >      Desc: Name of first related location.
-- >
-- >      Repr: an..70
simple3222 :: Parser Value
simple3222 = simple "3222" (alphaNumeric `upTo` 70)
