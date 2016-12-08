{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4079
  ( simple4079
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    4079  Handling instructions, coded
-- >
-- >    Desc: Identification of the instructions on how specified goods,
-- >          packages or containers should be handled.
-- >
-- >    Repr: an..3
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.  See also UNTDED 5.9 p.2 CIMP.
simple4079 :: Parser Value
simple4079 = simple "4079" (alphaNumeric `upTo` 3)
