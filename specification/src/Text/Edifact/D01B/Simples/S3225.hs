{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3225
  ( simple3225
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3225  Location name code                                      [C]
-- >
-- >      Desc: Code specifying the name of the location.
-- >
-- >      Repr: an..25
-- >
-- >      Note:
-- >            1 Recommend use UN/ECE Recommendation No. 16:
-- >            UN/LOCODE. If not applicable, use appropriate code set
-- >            in combination with 1131/3055.
simple3225 :: Parser Value
simple3225 = simple "3225" (alphaNumeric `upTo` 25)
