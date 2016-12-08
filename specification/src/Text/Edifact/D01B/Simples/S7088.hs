{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7088
  ( simple7088
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7088  Dangerous goods flashpoint value                        [B]
-- >
-- >      Desc: To specify the value of the flashpoint of dangerous
-- >            goods.
-- >
-- >      Repr: an..8
simple7088 :: Parser Value
simple7088 = simple "7088" (alphaNumeric `upTo` 8)
