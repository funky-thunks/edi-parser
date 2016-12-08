{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8459
  ( simple8459
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *    8459  Excess transportation responsibility code               [B]
-- >
-- >      Desc: Code specifying the responsibility for excess
-- >            transportation.
-- >
-- >      Repr: an..3
-- >
-- > X    A     Customer plant (receiving location)
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- >      B     Material release issuer
-- >               The responsibility for excess transportation is with the
-- >               material release issuer.
-- >
-- >      S     Supplier authority
-- >               The responsibility for excess transportation is with the
-- >               supplier authority.
-- >
-- >      X     Responsibility to be determined
-- >               The responsibility for the excess transportation is to
-- >               be determined.
-- >
-- >      ZZZ   Mutually defined
-- >               A code assigned within a code list to be used on an
-- >               interim basis and as defined among trading partners
-- >               until a precise code can be assigned to the code list.
simple8459 :: Parser Value
simple8459 = simple "8459" (alphaNumeric `upTo` 3)
