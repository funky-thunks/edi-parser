{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1222
  ( simple1222
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1222  Configuration level
-- >
-- >    Desc: Number indicating the level of an object which is in a
-- >          hierarchy.
-- >
-- >    Repr: n..2
simple1222 :: Parser Value
simple1222 = simple "1222" (numeric `upTo` 2)
