{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1056
  ( simple1056
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1056  Version identifier                                      [B]
-- >
-- >      Desc: To identify a version.
-- >
-- >      Repr: an..9
simple1056 :: Parser Value
simple1056 = simple "1056" (alphaNumeric `upTo` 9)
