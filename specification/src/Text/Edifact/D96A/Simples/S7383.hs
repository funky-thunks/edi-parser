{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7383
  ( simple7383
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   7383  Surface/layer indicator, coded
-- >
-- >   Desc: Code indicating the surface or layer of a product that is
-- >         being described.
-- >
-- >   Repr: an..3
-- >
-- >    1S     Side one
-- >              Self explanatory.
-- >    2S     Side two
-- >              Self explanatory.
-- >    AA     On surface
-- >              To indicate that the entity being specified is on the
-- >              surface.
-- >    AB     Off surface
-- >              To indicate that the entity being specified is off the
-- >              surface.
-- >    AC     Soluble
-- >              Specifies that the surface/layer/position being
-- >              described is the soluble portion.
-- >    BC     Back of cab
-- >              Self explanatory.
-- >    BS     Both sides
-- >              Self explanatory.
-- >    BT     Bottom
-- >              Self explanatory.
-- >    DF     Dual fuel tank positions
-- >              Self explanatory.
-- >    FR     Front
-- >              Self explanatory.
-- >    IN     Inside
-- >              Self explanatory.
-- >    LE     Left
-- >              Self explanatory.
-- >    OA     Overall
-- >              Self explanatory.
-- >    OS     One side
-- >              Self explanatory.
-- >    OT     Outside
-- >              Self explanatory.
-- >    RI     Right
-- >              Self explanatory.
-- >    RR     Rear
-- >              Self explanatory.
-- >    ST     Spare tyre position
-- >              Self explanatory.
-- >    TB     Tank bottom
-- >              Self explanatory.
-- >    TP     Top
-- >              Self explanatory.
-- >    TS     Two sides
-- >              Self explanatory.
-- >    UC     Under cab
-- >              Self explanatory.
simple7383 :: Parser Value
simple7383 = simple "7383" (alphaNumeric `upTo` 3)
