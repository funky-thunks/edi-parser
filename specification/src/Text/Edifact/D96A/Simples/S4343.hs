{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4343
  ( simple4343
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 4343  Response type, coded
-- >
-- >   Desc: Code specifying the type of acknowledgement required or
-- >         transmitted.
-- >
-- >   Repr: an..3
-- >
-- >    AA     Debit advice
-- >              Receiver of the payment message needs to return a debit
-- >              advice in response to the payment message.
-- >    AB     Message acknowledgement
-- >              Indicates that an acknowledge relating to receipt is
-- >              required.
-- >    AC     Acknowledge - with detail and change
-- >              Acknowledge complete including changes.
-- >    AD     Acknowledge - with detail, no change
-- >              Acknowledge complete without changes.
-- >    AF     Debit advice/message acknowledgement
-- >              The sender wishes to receive both a Debit Advice and an
-- >              acknowledgement of receipt for a payment message.
-- >    AG     Authentication
-- >              Authentication, by a party, of a document established for
-- >              him by another party.
-- > +  AI     Acknowledge only changes
-- >              Acknowledgement of changes only is required.
-- >    AP     Accepted
-- >              Indication that the referenced offer or transaction
-- >              (e.g., cargo booking or quotation request) has been
-- >              accepted.
-- >    CA     Conditionally accepted
-- >              Indication that the referenced offer or transaction
-- >              (e.g., cargo booking or quotation request) has been
-- >              accepted under conditions indicated in this message.
-- >    CO     Confirmation of measurements
-- >              Indication that the message contains the physical
-- >              measurements on which the charges will be based.
-- > #  NA     No acknowledgement needed
-- >              Self explanatory.
-- >    RE     Rejected
-- >              Indication that the referenced offer or transaction
-- >              (e.g., cargo booking or quotation request) is not
-- >              accepted.
simple4343 :: Parser Value
simple4343 = simple "4343" (alphaNumeric `upTo` 3)
