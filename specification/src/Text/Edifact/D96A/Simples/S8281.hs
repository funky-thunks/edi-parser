{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8281
  ( simple8281
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8281  Transport ownership, coded
-- >
-- >   Desc: Code indicating the ownership of the means of transport.
-- >
-- >   Repr: an..3
-- >
-- >         1 Transport for the owner's account
-- >              The owner of the transported goods is also the owner of
-- >              the means of transport or rented it for this transport.
-- >         2 Transport for another account
-- >              The owner of the transported goods does not own the means
-- >              of transport or has not rented it for this transport.
simple8281 :: Parser Value
simple8281 = simple "8281" (alphaNumeric `upTo` 3)
