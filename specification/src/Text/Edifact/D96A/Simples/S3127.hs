{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3127
  ( simple3127
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3127  Carrier identification
-- >
-- >    Desc: Identification of party undertaking or arranging transport of
-- >          goods between named points.
-- >
-- >    Repr: an..17
-- >
-- >    Note: User or association defined code.  May be used in combination
-- >          with 1131/3055.
simple3127 :: Parser Value
simple3127 = simple "3127" (alphaNumeric `upTo` 17)
