{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8158
  ( simple8158
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8158  Orange hazard placard upper part identifier             [B]
-- >
-- >      Desc: To specify the identity number for the upper part of
-- >            the orange hazard placard required on the means of
-- >            transport.
-- >
-- >      Repr: an..4
simple8158 :: Parser Value
simple8158 = simple "8158" (alphaNumeric `upTo` 4)
