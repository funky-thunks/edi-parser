{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1218
  ( simple1218
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1218  Number of originals of document required
-- >
-- >    Desc: Specification of the number of originals of a stipulated
-- >          document that are required.
-- >
-- >    Repr: n..2
simple1218 :: Parser Value
simple1218 = simple "1218" (numeric `upTo` 2)
