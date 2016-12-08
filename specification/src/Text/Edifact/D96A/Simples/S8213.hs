{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8213
  ( simple8213
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8213  Id. of means of transport identification
-- >
-- >    Desc: Identification of the means of transport by name or number.
-- >
-- >    Repr: an..9
-- >
-- >    Note: Use relevant code.  May be used in combination with
-- >          1131/3055.
simple8213 :: Parser Value
simple8213 = simple "8213" (alphaNumeric `upTo` 9)
