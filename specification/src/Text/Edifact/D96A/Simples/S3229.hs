{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3229
  ( simple3229
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3229  Country sub-entity identification
-- >
-- >    Desc: Identification of the name of sub-entities (state, province)
-- >          defined by appropriate governmental agencies.
-- >
-- >    Repr: an..9
-- >
-- >    Note: Use code defined by appropriate national authority.
simple3229 :: Parser Value
simple3229 = simple "3229" (alphaNumeric `upTo` 9)
