{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6155
  ( simple6155
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 6155  Measurement attribute, coded
-- >
-- >   Desc: Code used to specify non-discrete measurement values.
-- >
-- >   Repr: an..3
-- >
-- >         1 Clear
-- >              Self explanatory.
-- >         2 Hazy
-- >              Self explanatory.
-- >         3 Excess
-- >              Self explanatory.
-- >         4 Some
-- >              Self explanatory.
-- >         5 Undetectable
-- >              Self explanatory.
-- >         6 Trace
-- >              Self explanatory.
-- >         7 Yes
-- >              Self explanatory.
-- >         8 Closed
-- >              Self explanatory.
-- >         9 Passed
-- >              Self explanatory.
-- >        10 Present
-- >              Self explanatory.
-- >        11 Gel
-- >              Self explanatory.
-- >        12 OK
-- >              Self explanatory.
-- >        13 Slight
-- >              Self explanatory.
-- >        14 No Good
-- >              Self explanatory.
-- >        15 Marginal
-- >              Self explanatory.
-- >        16 Nil
-- >              Self explanatory.
-- >        18 Open
-- >              Self explanatory.
-- >        19 Free
-- >              Self explanatory.
-- >        20 No
-- >              Self explanatory.
-- >        21 Checked
-- >              Self explanatory.
-- >        22 Fail
-- >              Self explanatory.
-- >        23 Absent
-- >              Self explanatory.
-- >        24 Good
-- >              Self explanatory.
-- >        25 Fair
-- >              Self explanatory.
-- >        26 Poor
-- >              Self explanatory.
-- >        27 Excellent
-- >              Self explanatory.
-- >        28 Bright
-- >              Self explanatory.
-- >        29 To be determined
-- >              Self explanatory.
-- >        32 Conditional, free
-- >              Self explanatory.
-- >        33 Balance
-- >              Self explanatory.
-- >        34 Complete
-- >              Self explanatory.
-- >        35 Low
-- >              Self explanatory.
-- >        36 Not applicable
-- >              Self explanatory.
-- >        37 Not determined
-- >              Self explanatory.
-- >        38 Negligible
-- >              Self explanatory.
-- >        39 Moderate
-- >              Self explanatory.
-- >        40 Appreciable
-- >              Self explanatory.
-- >        41 Not available
-- >              Self explanatory.
-- > +      42 Uncontrolled temperature
-- >              Uncontrolled temperature conditions.
-- > +      43 Chilled
-- >              Somewhere between four degrees Celsius and twelve degrees
-- >              Celsius.
-- > +      44 Frozen
-- >              Less than zero degrees Celsius.
-- > +      45 Temperature controlled
-- >              Required temperature value.
simple6155 :: Parser Value
simple6155 = simple "6155" (alphaNumeric `upTo` 3)
