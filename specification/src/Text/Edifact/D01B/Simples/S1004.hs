{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1004
  ( simple1004
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1004  Document identifier                                     [C]
-- >
-- >      Desc: To identify a document.
-- >
-- >      Repr: an..35
simple1004 :: Parser Value
simple1004 = simple "1004" (alphaNumeric `upTo` 35)
