{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3413
  ( simple3413
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3413  Department or employee name code                        [C]
-- >
-- >      Desc: Code specifying the name of a department or employee.
-- >
-- >      Repr: an..17
simple3413 :: Parser Value
simple3413 = simple "3413" (alphaNumeric `upTo` 17)
