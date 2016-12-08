{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1218
  ( simple1218
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1218  Document originals required quantity                    [B]
-- >
-- >      Desc: Quantity of document originals required.
-- >
-- >      Repr: n..2
simple1218 :: Parser Value
simple1218 = simple "1218" (numeric `upTo` 2)
