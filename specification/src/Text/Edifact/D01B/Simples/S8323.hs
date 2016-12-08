{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8323
  ( simple8323
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8323  Transport movement code                                 [B]
-- >
-- >      Desc: Code specifying the transport movement.
-- >
-- >      Repr: an..3
-- >
-- >      1     Export
-- >               Self explanatory.
-- >
-- >      2     Import
-- >               Self explanatory.
-- >
-- >      3     Transit
-- >               The cargo is moving in transit through a country and
-- >               will not become part of the commerce of that country.
-- >
-- >      4     Relay
-- >               The cargo is being moved by more than one transport
-- >               means in succession under the responsibility of the same
-- >               carrier.
-- >
-- >      5     Transshipment
-- >               The cargo is being moved by more than one transport
-- >               means in succession.
simple8323 :: Parser Value
simple8323 = simple "8323" (alphaNumeric `upTo` 3)
