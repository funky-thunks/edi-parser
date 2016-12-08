{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3229
  ( simple3229
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > |    3229  Country sub-entity name code                            [C]
-- >
-- >      Desc: Code specifying the name of a country sub-entity.
-- >
-- >      Repr: an..9
-- >
-- >      Note:
-- > |          1 Recommended use ISO 3166-2. If not applicable, use
-- >            appropriate code set defined by appropriate national
-- >            authority.
simple3229 :: Parser Value
simple3229 = simple "3229" (alphaNumeric `upTo` 9)
