{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8067
  ( simple8067
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8067  Transport mode name code                                [B]
-- >
-- >      Desc: Code specifying the name of a mode of transport.
-- >
-- >      Repr: an..3
-- >
-- >      Note:
-- >            1 Use UN/ECE Recommendation No 19.
simple8067 :: Parser Value
simple8067 = simple "8067" (alphaNumeric `upTo` 3)
