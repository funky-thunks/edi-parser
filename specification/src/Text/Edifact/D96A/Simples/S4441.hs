{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4441
  ( simple4441
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    4441  Free text, coded
-- >
-- >    Desc: Free text in coded form.
-- >
-- >    Repr: an..3
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple4441 :: Parser Value
simple4441 = simple "4441" (alphaNumeric `upTo` 3)
