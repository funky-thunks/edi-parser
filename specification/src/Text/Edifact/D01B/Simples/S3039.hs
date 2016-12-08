{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3039
  ( simple3039
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3039  Party identifier                                        [C]
-- >
-- >      Desc: Code specifying the identity of a party.
-- >
-- >      Repr: an..35
simple3039 :: Parser Value
simple3039 = simple "3039" (alphaNumeric `upTo` 35)
