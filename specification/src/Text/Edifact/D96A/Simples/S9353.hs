{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9353
  ( simple9353
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   9353  Government procedure, coded
-- >
-- >   Desc: Code identifying the treatment applied by the government to
-- >         goods which are subject to a control.
-- >
-- >   Repr: an..3
-- >
-- >         1 Already customs cleared in the importing country
-- >              Arrangements for inspection are not necessary because
-- >              they were cleared before.
-- >         2 Documents requirements completed
-- >              All requirements for documents have been completed.
-- >         3 Documents required
-- >              Pertinent documents are required.
-- >         4 Inspection arrangements completed
-- >              Arrangements for inspection of the cargo have been
-- >              completed.
-- >         5 Inspection arrangements required
-- >              Arrangements for inspection of the cargo are required.
-- >         6 No customs procedure
-- >              Customs clearance not required.
-- >         7 Safety arrangements completed
-- >              Arrangements for safeguarding the cargo have been
-- >              completed.
-- >         8 Safety arrangements required
-- >              Arrangements for safeguarding the cargo are required.
-- >         9 Security arrangements required
-- >              Arrangements for the security of the cargo are required.
-- >        10 Storage arrangements completed
-- >              Arrangements for storing the cargo have been completed.
-- >        11 Storage arrangements required
-- >              Arrangements for storing the cargo are required.
-- >        12 Transport arrangements completed
-- >              All arrangements for transport have been completed.
-- >        13 Transport arrangements required
-- >              Transport has to be arranged.
simple9353 :: Parser Value
simple9353 = simple "9353" (alphaNumeric `upTo` 3)
