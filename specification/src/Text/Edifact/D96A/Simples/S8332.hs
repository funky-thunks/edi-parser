{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8332
  ( simple8332
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8332  Equipment plan
-- >
-- >    Desc: Description indicating equipment plan, e.g. FCL or LCL.
-- >
-- >    Repr: an..26
simple8332 :: Parser Value
simple8332 = simple "8332" (alphaNumeric `upTo` 26)
