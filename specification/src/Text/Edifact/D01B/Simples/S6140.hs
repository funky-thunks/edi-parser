{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6140
  ( simple6140
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6140  Width dimension value                                   [C]
-- >
-- >      Desc: To specify the value of a width dimension.
-- >
-- >      Repr: n..15
simple6140 :: Parser Value
simple6140 = simple "6140" (numeric `upTo` 15)
