{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8186
  ( simple8186
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8186  Orange hazard placard lower part identifier             [B]
-- >
-- >      Desc: To specify the identity number for the lower part of
-- >            the orange hazard placard required on the means of
-- >            transport.
-- >
-- >      Repr: an4
simple8186 :: Parser Value
simple8186 = simple "8186" (alphaNumeric `exactly` 4)
