{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8410
  ( simple8410
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8410  Hazard medical first aid guide identifier               [B]
-- >
-- >      Desc: To identify a Medical First Aid Guide (MFAG) for
-- >            hazardous goods.
-- >
-- >      Repr: an..4
simple8410 :: Parser Value
simple8410 = simple "8410" (alphaNumeric `upTo` 4)
