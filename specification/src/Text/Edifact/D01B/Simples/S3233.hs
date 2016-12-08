{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3233
  ( simple3233
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3233  Second related location name code                       [C]
-- >
-- >      Desc: Code specifying the second related location.
-- >
-- >      Repr: an..25
-- >
-- >      Note:
-- >            1 Recommend use UN/ECE Recommendation No. 16:
-- >            UN/LOCODE. If not applicable, use appropriate code set
-- >            in combination with 1131/3055.
simple3233 :: Parser Value
simple3233 = simple "3233" (alphaNumeric `upTo` 25)
