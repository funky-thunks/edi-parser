{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3128
  ( simple3128
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3128  Carrier name
-- >
-- >    Desc: Name of party undertaking or arranging transport of goods
-- >          between named points.
-- >
-- >    Repr: an..35
simple3128 :: Parser Value
simple3128 = simple "3128" (alphaNumeric `upTo` 35)
