{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3251
  ( simple3251
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3251  Postal identification code                              [C]
-- >
-- >      Desc: Code specifying the postal zone or address.
-- >
-- >      Repr: an..17
-- >
-- >      Note:
-- >            1 Use code defined by appropriate national authority.
simple3251 :: Parser Value
simple3251 = simple "3251" (alphaNumeric `upTo` 17)
