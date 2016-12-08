{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3453
  ( simple3453
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3453  Language, coded
-- >
-- >    Desc: Code of language (ISO 639-1988).
-- >
-- >    Repr: an..3
-- >
-- >    Note: Use ISO 639-1988.
simple3453 :: Parser Value
simple3453 = simple "3453" (alphaNumeric `upTo` 3)
