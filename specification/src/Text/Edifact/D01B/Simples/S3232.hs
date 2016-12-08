{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3232
  ( simple3232
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3232  Second related location name                            [B]
-- >
-- >      Desc: Name of the second related location.
-- >
-- >      Repr: an..70
simple3232 :: Parser Value
simple3232 = simple "3232" (alphaNumeric `upTo` 70)
