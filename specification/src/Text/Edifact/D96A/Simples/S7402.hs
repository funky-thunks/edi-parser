{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7402
  ( simple7402
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7402  Identity number
-- >
-- >    Desc: A value given to an object for identification purposes.
-- >
-- >    Repr: an..35
simple7402 :: Parser Value
simple7402 = simple "7402" (alphaNumeric `upTo` 35)
