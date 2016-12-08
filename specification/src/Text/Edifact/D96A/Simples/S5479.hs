{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5479
  ( simple5479
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    5479  Relation, coded
-- >
-- >    Desc: To specify the relationship between two or more items.
-- >
-- >    Repr: an..3
-- >
-- >    Note: Code values to be provided.
simple5479 :: Parser Value
simple5479 = simple "5479" (alphaNumeric `upTo` 3)
