{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7297
  ( simple7297
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 7297  Set identification qualifier
-- >
-- >   Desc: Identification of the type of set.
-- >
-- >   Repr: an..3
-- >
-- >         1 Product
-- >              Self explanatory.
-- >         2 Licence
-- >              Description to be provided.
-- >         3 Package
-- >              Related numbers identifying a package such as a bar code
-- >              label number related to a kanban card number, etc.
-- >         4 Vehicle reference set
-- >              A code which indicates that the identities which follow
-- >              are related to a particular vehicle which may have been
-- >              previously identified.
-- >         5 Source database
-- >              The source database of the data in a data set.
-- >         6 Target database
-- >              The target database for the data in a data set.
-- >         7 Value list
-- >              A coded or non coded list of values.
-- > +       8 Contract
-- >              The contract related item numbers.
-- > +       9 Financial security
-- >              Financial security identifier set.
simple7297 :: Parser Value
simple7297 = simple "7297" (alphaNumeric `upTo` 3)
