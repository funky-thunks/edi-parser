{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3251
  ( simple3251
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3251  Postcode identification
-- >
-- >    Desc: Code defining postal zones or addresses.
-- >
-- >    Repr: an..9
-- >
-- >    Note: Use code defined by appropriate national authority.
simple3251 :: Parser Value
simple3251 = simple "3251" (alphaNumeric `upTo` 9)
