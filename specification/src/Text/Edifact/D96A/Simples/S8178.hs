{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8178
  ( simple8178
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8178  Type of means of transport
-- >
-- >    Desc: Description of the type of the means of transport being
-- >          utilized.
-- >
-- >    Repr: an..17
simple8178 :: Parser Value
simple8178 = simple "8178" (alphaNumeric `upTo` 17)
