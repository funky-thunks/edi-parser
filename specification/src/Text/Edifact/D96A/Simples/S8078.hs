{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8078
  ( simple8078
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8078  Hazard substance/item/page number
-- >
-- >    Desc: Number giving additional hazard code classification of a
-- >          goods item within the applicable dangerous goods regulation.
-- >
-- >    Repr: an..7
simple8078 :: Parser Value
simple8078 = simple "8078" (alphaNumeric `upTo` 7)
