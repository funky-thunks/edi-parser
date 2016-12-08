{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8126
  ( simple8126
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8126  Transport emergency card identifier                     [B]
-- >
-- >      Desc: To identify a transport emergency (TREM) card.
-- >
-- >      Repr: an..10
simple8126 :: Parser Value
simple8126 = simple "8126" (alphaNumeric `upTo` 10)
