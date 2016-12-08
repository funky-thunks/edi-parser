{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8066
  ( simple8066
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8066  Mode of transport
-- >
-- >    Desc: Method of transport used for the carriage of the goods.
-- >
-- >    Repr: an..17
simple8066 :: Parser Value
simple8066 = simple "8066" (alphaNumeric `upTo` 17)
