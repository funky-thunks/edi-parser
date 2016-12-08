{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8028
  ( simple8028
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8028  Means of transport journey identifier                   [B]
-- >
-- >      Desc: To identify a journey of a means of transport.
-- >
-- >      Repr: an..17
simple8028 :: Parser Value
simple8028 = simple "8028" (alphaNumeric `upTo` 17)
