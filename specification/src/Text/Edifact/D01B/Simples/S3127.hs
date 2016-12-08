{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3127
  ( simple3127
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3127  Carrier identifier                                      [B]
-- >
-- >      Desc: To identify a carrier.
-- >
-- >      Repr: an..17
simple3127 :: Parser Value
simple3127 = simple "3127" (alphaNumeric `upTo` 17)
