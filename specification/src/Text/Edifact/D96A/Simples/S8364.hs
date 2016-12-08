{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8364
  ( simple8364
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8364  EMS number
-- >
-- >    Desc: Emergency procedures for ships carrying dangerous goods.
-- >
-- >    Repr: an..6
simple8364 :: Parser Value
simple8364 = simple "8364" (alphaNumeric `upTo` 6)
