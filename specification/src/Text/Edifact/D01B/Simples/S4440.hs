{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4440
  ( simple4440
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4440  Free text value                                         [C]
-- >
-- >      Desc: Free form text.
-- >
-- >      Repr: an..512
simple4440 :: Parser Value
simple4440 = simple "4440" (alphaNumeric `upTo` 512)
