{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1082
  ( simple1082
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1082  Line item number
-- >
-- >    Desc: Serial number designating each separate item within a series
-- >          of articles.
-- >
-- >    Repr: n..6
simple1082 :: Parser Value
simple1082 = simple "1082" (numeric `upTo` 6)
