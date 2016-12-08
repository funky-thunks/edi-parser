{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1000
  ( simple1000
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1000  Document name                                           [B]
-- >
-- >      Desc: Name of a document.
-- >
-- >      Repr: an..35
simple1000 :: Parser Value
simple1000 = simple "1000" (alphaNumeric `upTo` 35)
