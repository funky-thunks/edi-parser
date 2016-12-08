{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1496
  ( simple1496
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1496  Goods item number
-- >
-- >    Desc: Serial number differentiating each separate goods item entry
-- >          of a consignment as contained in one document/declaration.
-- >
-- >    Repr: n..5
simple1496 :: Parser Value
simple1496 = simple "1496" (numeric `upTo` 5)
