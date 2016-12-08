{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3124
  ( simple3124
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3124  Name and address description                            [C]
-- >
-- >      Desc: Free form description of a name and address line.
-- >
-- >      Repr: an..35
simple3124 :: Parser Value
simple3124 = simple "3124" (alphaNumeric `upTo` 35)
