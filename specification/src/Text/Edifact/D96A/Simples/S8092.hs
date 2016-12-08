{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8092
  ( simple8092
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8092  Hazard code version number
-- >
-- >    Desc: The version/revision number of date of issuance of the code
-- >          used.
-- >
-- >    Repr: an..10
simple8092 :: Parser Value
simple8092 = simple "8092" (alphaNumeric `upTo` 10)
