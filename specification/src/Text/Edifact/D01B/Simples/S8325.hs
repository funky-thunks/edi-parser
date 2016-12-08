{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8325
  ( simple8325
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *    8325  Hazardous means of transport category code              [B]
-- >
-- >      Desc: Code specifying the category of means of transport for
-- >            carrying hazardous goods.
-- >
-- >      Repr: an..3
-- >
-- > X    1     ADNR code, OS
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    2     ADNR code, 1N
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    3     ADNR code, 1S
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    4     ADNR code, 2
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    5     ADNR code, 3
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    6     ADNR code, F
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    7     ADNR code, NF
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    8     ADNR code, ON
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    9     ADNR code, X
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
simple8325 :: Parser Value
simple8325 = simple "8325" (alphaNumeric `upTo` 3)
