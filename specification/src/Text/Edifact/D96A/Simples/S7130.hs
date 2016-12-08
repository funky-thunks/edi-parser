{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7130
  ( simple7130
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7130  Customer authorization number
-- >
-- >    Desc: Customer provided authorization number to allow supplier to
-- >          ship goods under specific freight conditions.  This number
-- >          will be transmitted back to customer in the dispatch advice
-- >          message.
-- >
-- >    Repr: an..17
simple7130 :: Parser Value
simple7130 = simple "7130" (alphaNumeric `upTo` 17)
