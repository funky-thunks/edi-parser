{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8453
  ( simple8453
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8453  Nationality of means of transport, coded
-- >
-- >    Desc: Coded name of the country in which a means of transport is
-- >          registered.
-- >
-- >    Repr: an..3
-- >
-- >    Note: Use ISO 3166 alpha two country code.
simple8453 :: Parser Value
simple8453 = simple "8453" (alphaNumeric `upTo` 3)
