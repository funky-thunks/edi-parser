{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8453
  ( simple8453
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > |    8453  Transport means nationality code                        [B]
-- >
-- >      Desc: Code specifying the nationality of a means of
-- >            transport.
-- >
-- >      Repr: an..3
-- >
-- >      Note:
-- > |          1 Use ISO 3166-1 two alpha country code.
simple8453 :: Parser Value
simple8453 = simple "8453" (alphaNumeric `upTo` 3)
