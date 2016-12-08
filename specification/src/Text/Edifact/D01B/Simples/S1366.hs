{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1366
  ( simple1366
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1366  Document source description                             [B]
-- >
-- >      Desc: Free form description of the source of a document.
-- >
-- >      Repr: an..70
simple1366 :: Parser Value
simple1366 = simple "1366" (alphaNumeric `upTo` 70)
