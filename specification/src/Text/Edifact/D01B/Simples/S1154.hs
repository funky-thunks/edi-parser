{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1154
  ( simple1154
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1154  Reference identifier                                    [C]
-- >
-- >      Desc: Identifies a reference.
-- >
-- >      Repr: an..70
simple1154 :: Parser Value
simple1154 = simple "1154" (alphaNumeric `upTo` 70)
