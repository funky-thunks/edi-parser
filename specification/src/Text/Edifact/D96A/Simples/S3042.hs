{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3042
  ( simple3042
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3042  Street and number/p.o. box
-- >
-- >    Desc: Street and number in plain language, or Post Office Box No.
-- >
-- >    Repr: an..35
simple3042 :: Parser Value
simple3042 = simple "3042" (alphaNumeric `upTo` 35)
