{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3207
  ( simple3207
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > |    3207  Country name code                                       [C]
-- >
-- > |    Desc: Identification of the name of the country or other
-- >            geographical entity as defined in ISO 3166-1.
-- >
-- >      Repr: an..3
-- >
-- >      Note:
-- > |          1 Use ISO 3166-1 two alpha country code.
simple3207 :: Parser Value
simple3207 = simple "3207" (alphaNumeric `upTo` 3)
