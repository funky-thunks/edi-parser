{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8260
  ( simple8260
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8260  Equipment identifier                                    [B]
-- >
-- >      Desc: To identify equipment.
-- >
-- >      Repr: an..17
simple8260 :: Parser Value
simple8260 = simple "8260" (alphaNumeric `upTo` 17)
