{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7419
  ( simple7419
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *    7419  Hazardous material category name code                   [B]
-- >
-- >      Desc: Code specifying a kind of hazard for a material.
-- >
-- >      Repr: an..7
simple7419 :: Parser Value
simple7419 = simple "7419" (alphaNumeric `upTo` 7)
