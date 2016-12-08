{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8213
  ( simple8213
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8213  Transport means identification name identifier          [B]
-- >
-- >      Desc: Identifies the name of the transport means.
-- >
-- >      Repr: an..9
simple8213 :: Parser Value
simple8213 = simple "8213" (alphaNumeric `upTo` 9)
