{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4404
  ( simple4404
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4404  Status description                                      [B]
-- >
-- >      Desc: Free form description of a status.
-- >
-- >      Repr: an..35
simple4404 :: Parser Value
simple4404 = simple "4404" (alphaNumeric `upTo` 35)
