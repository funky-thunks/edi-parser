{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1312
  ( simple1312
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1312  Consignment load sequence identifier                    [B]
-- >
-- >      Desc: To identify the loading sequence of a consignment or
-- >            consignments.
-- >
-- >      Repr: n..4
simple1312 :: Parser Value
simple1312 = simple "1312" (numeric `upTo` 4)
