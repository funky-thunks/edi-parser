{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1220
  ( simple1220
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1220  Document copies required quantity                       [B]
-- >
-- >      Desc: Quantity of document copies required.
-- >
-- >      Repr: n..2
simple1220 :: Parser Value
simple1220 = simple "1220" (numeric `upTo` 2)
