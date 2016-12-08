{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Common.Segments.UNZ
  ( segmentUNZ
  ) where

import           Text.Edifact.Common.Simples (simple0020, simple0036)

import           Text.Edifact.Parsing
import           Text.Edifact.Types          (Value)

-- | Derived from this specification:
--
-- > Pos	        Segment	                        M/C	Repeat	Repr.	Notes
-- > 010		0036	Interchange control count	      M	  1 	    n..6
-- > 020		0020	Interchange control reference	  M	  1	      an..14
--
-- Dependencies: 'simple0020', 'simple0036'.
segmentUNZ :: Parser Value
segmentUNZ =
  segment "UNZ"
    [ "010" .@ mandatory simple0036
    , "030" .@ mandatory simple0020
    ]
