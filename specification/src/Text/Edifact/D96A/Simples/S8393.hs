{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8393
  ( simple8393
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8393  Returnable package load contents, coded
-- >
-- >   Desc: To indicate the composition of goods loaded into a returnable
-- >         package.
-- >
-- >   Repr: an..3
-- >
-- >         1 Loaded with empty 4-block for blocking purposes
-- >              Description to be provided.
-- >         2 Empty container with dunnage
-- >              Description to be provided.
-- >         3 Empty container
-- >              Description to be provided.
-- >         4 Loaded with production material
-- >              Description to be provided.
-- >         5 Mixed empty and loaded
-- >              Description to be provided.
-- >         6 Obsolete material
-- >              Description to be provided.
-- >         7 Loaded with excess returned production material
-- >              Description to be provided.
-- >         8 Loaded with rejected material
-- >              Description to be provided.
-- >         9 Service part obsolete container
-- >              Description to be provided.
-- >        10 Loaded with returned processed material
-- >              Description to be provided.
simple8393 :: Parser Value
simple8393 = simple "8393" (alphaNumeric `upTo` 3)
