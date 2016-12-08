{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8364
  ( simple8364
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8364  Emergency procedure for ships identifier                [B]
-- >
-- >      Desc: To identify the emergency procedure number for ships
-- >            transporting dangerous goods. Synonym: EMS Number.
-- >
-- >      Repr: an..6
simple8364 :: Parser Value
simple8364 = simple "8364" (alphaNumeric `upTo` 6)
