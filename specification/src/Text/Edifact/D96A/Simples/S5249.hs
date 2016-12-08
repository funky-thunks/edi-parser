{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5249
  ( simple5249
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   5249  Percentage basis, coded
-- >
-- >   Desc: Indication of the application of a percentage.
-- >
-- >   Repr: an..3
-- >
-- >         1 Per unit
-- >              Referenced percentage applies on a single unit basis.
-- >         2 Per ton
-- >              Reduction percentage is applied per transported ton.
-- >         3 Per equipment unit
-- >              Reduction percentage is applied per main equipment unit
-- >              (for rail purpose, only rail wagons).
-- >         4 Per unit price
-- >              Reduction percentage is applied on the unit price, which
-- >              is the basis of the charge calculation.
-- >         5 Per quantity
-- >              Reduction percentage applied on the unit price and
-- >              conceded to a consignor after he reached a specified
-- >              tonnage of transport.
-- >         6 Basic charge
-- >              Code to indicate that the IATA experimental special
-- >              charge within Europe is the basis for the percentage
-- >              reduction or surcharge.
-- >         7 Rate per kilogram
-- >              Code to indicate that the IATA experimental special rate
-- >              within in Europe is the basis for the percentage
-- >              reduction or surcharge.
-- >         8 Minimum charge
-- >              Code to indicate that the IATA minimum charge is the
-- >              basis for the percentage reduction or surcharge.
-- >         9 Normal rate
-- >              Code to indicate that the IATA normal rate is the basis
-- >              for the percentage reduction or surcharge.
-- >        10 Quantity rate
-- >              Code to indicate that the IATA quantity rate is the basis
-- >              for the percentage reduction or surcharge.
-- >        11 Amount of drawing
-- >              Referenced percentage applies on the amount of drawing
-- >              under the documentary credit.
-- >        12 Documentary credit amount
-- >              Referenced percentage applies on documentary credit
-- >              amount.
-- >        13 Invoice value
-- >              Referenced percentage applies on the invoice value.
-- >        14 CIF value
-- >              Referenced percentage applies on CIF value.
simple5249 :: Parser Value
simple5249 = simple "5249" (alphaNumeric `upTo` 3)
