{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8067
  ( simple8067
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8067  Mode of transport, coded
-- >
-- >    Desc: Coded method of transport used for the carriage of the goods.
-- >
-- >    Repr: an..3
-- >
-- >    Note: Use UN/ECE Recommendation No 19.
simple8067 :: Parser Value
simple8067 = simple "8067" (alphaNumeric `upTo` 3)
