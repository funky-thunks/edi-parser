{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3039
  ( simple3039
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3039  Party id. identification
-- >
-- >    Desc: Code identifying a party involved in a transaction.
-- >
-- >    Repr: an..35
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple3039 :: Parser Value
simple3039 = simple "3039" (alphaNumeric `upTo` 35)
