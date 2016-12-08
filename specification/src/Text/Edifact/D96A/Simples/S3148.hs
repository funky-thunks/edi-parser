{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3148
  ( simple3148
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *| 3148  Communication number
-- >
-- > |  Desc: The communication number.
-- >
-- >    Repr: an..512
simple3148 :: Parser Value
simple3148 = simple "3148" (alphaNumeric `upTo` 512)
