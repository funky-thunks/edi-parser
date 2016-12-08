{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3413
  ( simple3413
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3413  Department or employee identification
-- >
-- >    Desc: Internal identification code.
-- >
-- >    Repr: an..17
-- >
-- >    Note: Code specified by organisation concerned.
simple3413 :: Parser Value
simple3413 = simple "3413" (alphaNumeric `upTo` 17)
