{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6140
  ( simple6140
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6140  Width dimension
-- >
-- >    Desc: Width of pieces or packages stated for transport purposes.
-- >
-- >    Repr: n..15
simple6140 :: Parser Value
simple6140 = simple "6140" (numeric `upTo` 15)
