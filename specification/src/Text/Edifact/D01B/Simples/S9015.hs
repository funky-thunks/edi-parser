{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S9015
  ( simple9015
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      9015  Status category code                                    [B]
-- >
-- >      Desc: Code specifying the category of a status.
-- >
-- >      Repr: an..3
-- >
-- >      1     Transport
-- >               Status type is related to transport.
-- >
-- >      2     Order administration
-- >               Status type is related to order administration.
-- >
-- >      3     Inspection result
-- >               To specify the result of an inspection.
-- >
-- >      4     Publication issue claim
-- >               The status reported is related to a publication issue
-- >               claim.
-- >
-- >      5     Legal category
-- >               Status category is of, related to or concerned with the
-- >               law.
simple9015 :: Parser Value
simple9015 = simple "9015" (alphaNumeric `upTo` 3)
