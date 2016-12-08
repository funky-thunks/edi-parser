{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1490
  ( simple1490
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1490  Consolidation item number
-- >
-- >    Desc: Serial number differentiating each separate consignment
-- >          included in the consolidation.
-- >
-- >    Repr: n..4
simple1490 :: Parser Value
simple1490 = simple "1490" (numeric `upTo` 4)
