{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3223
  ( simple3223
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3223  First related location name code                        [C]
-- >
-- >      Desc: Code specifying first related location.
-- >
-- >      Repr: an..25
-- >
-- >      Note:
-- >            1 Recommend use UN/ECE Recommendation No. 16:
-- >            UN/LOCODE. If not applicable, use appropriate code set
-- >            in combination with 1131/3055.
simple3223 :: Parser Value
simple3223 = simple "3223" (alphaNumeric `upTo` 25)
