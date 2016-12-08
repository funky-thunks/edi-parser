{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1220
  ( simple1220
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1220  Number of copies of document required
-- >
-- >    Desc: Number of originals or copies of a document stipulated or
-- >          referred to as being required.
-- >
-- >    Repr: n..2
simple1220 :: Parser Value
simple1220 = simple "1220" (numeric `upTo` 2)
