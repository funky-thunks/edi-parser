{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8078
  ( simple8078
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8078  Additional hazard classification identifier             [B]
-- >
-- >      Desc: To identify an additional hazard classification.
-- >
-- >      Repr: an..7
simple8078 :: Parser Value
simple8078 = simple "8078" (alphaNumeric `upTo` 7)
