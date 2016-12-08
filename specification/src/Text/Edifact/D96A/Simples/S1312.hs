{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1312
  ( simple1312
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1312  Consignment load sequence number
-- >
-- >    Desc: To indicate the sequence of loading in which the consignments
-- >          are loaded in a piece of equipment or in a means of transport
-- >          (e.g. truck).
-- >
-- >    Repr: n..4
simple1312 :: Parser Value
simple1312 = simple "1312" (numeric `upTo` 4)
