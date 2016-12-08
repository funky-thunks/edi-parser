{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8212
  ( simple8212
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8212  Id. of the means of transport
-- >
-- >    Desc: Identification of the means of transport by name or number.
-- >
-- >    Repr: an..35
-- >
-- >    Note: Use relevant code.  May be used in combination with
-- >          1131/3055.
simple8212 :: Parser Value
simple8212 = simple "8212" (alphaNumeric `upTo` 35)
