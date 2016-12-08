{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4441
  ( simple4441
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4441  Free text value code                                    [B]
-- >
-- >      Desc: Code specifying free form text.
-- >
-- >      Repr: an..17
simple4441 :: Parser Value
simple4441 = simple "4441" (alphaNumeric `upTo` 17)
