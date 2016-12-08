{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8092
  ( simple8092
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8092  Hazard code version identifier                          [B]
-- >
-- >      Desc: To identify the version number of a hazard code.
-- >
-- >      Repr: an..10
simple8092 :: Parser Value
simple8092 = simple "8092" (alphaNumeric `upTo` 10)
