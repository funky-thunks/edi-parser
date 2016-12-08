{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3412
  ( simple3412
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3412  Department or employee
-- >
-- >    Desc: The department or person within an organizational entity.
-- >
-- >    Repr: an..35
simple3412 :: Parser Value
simple3412 = simple "3412" (alphaNumeric `upTo` 35)
