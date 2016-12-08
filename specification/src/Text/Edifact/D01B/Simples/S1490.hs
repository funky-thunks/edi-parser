{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1490
  ( simple1490
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1490  Consolidation item number                               [B]
-- >
-- >      Desc: To specify a consignment within a consolidation.
-- >
-- >      Repr: n..4
simple1490 :: Parser Value
simple1490 = simple "1490" (numeric `upTo` 4)
