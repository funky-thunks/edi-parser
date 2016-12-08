{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7065
  ( simple7065
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7065  Package type description code                           [B]
-- >
-- >      Desc: Code specifying the type of package.
-- >
-- >      Repr: an..17
-- >
-- >      Note:
-- >            1 Recommend use UN/ECE Recommendation No. 21 (also,
-- >            see current volume of UNTDED).
simple7065 :: Parser Value
simple7065 = simple "7065" (alphaNumeric `upTo` 17)
