{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7083
  ( simple7083
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   7083  Configuration, coded
-- >
-- >   Desc: Code indicating the status of the sub-line item in the
-- >         configuration.
-- >
-- >   Repr: an..3
-- >
-- >    A      Added to the configuration
-- >              Self explanatory.
-- >    D      Deleted from the configuration
-- >              Self explanatory.
-- >    I      Included in the configuration
-- >              Self explanatory.
simple7083 :: Parser Value
simple7083 = simple "7083" (alphaNumeric `upTo` 3)
