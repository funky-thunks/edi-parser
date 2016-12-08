{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S2380
  ( simple2380
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      2380  Date or time or period value                            [C]
-- >
-- >      Desc: The value of a date, a date and time, a time or of a
-- >            period in a specified representation.
-- >
-- >      Repr: an..35
simple2380 :: Parser Value
simple2380 = simple "2380" (alphaNumeric `upTo` 35)
