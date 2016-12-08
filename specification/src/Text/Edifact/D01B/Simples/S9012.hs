{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S9012
  ( simple9012
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      9012  Status reason description                               [B]
-- >
-- >      Desc: Free form description of the status reason.
-- >
-- >      Repr: an..256
simple9012 :: Parser Value
simple9012 = simple "9012" (alphaNumeric `upTo` 256)
