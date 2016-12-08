{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7009
  ( simple7009
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7009  Item description identification
-- >
-- >    Desc: Code from an industry code list which provides specific data
-- >          about a product characteristic.
-- >
-- >    Repr: an..17
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple7009 :: Parser Value
simple7009 = simple "7009" (alphaNumeric `upTo` 17)
