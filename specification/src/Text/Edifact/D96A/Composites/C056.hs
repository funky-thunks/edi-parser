{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C056
  ( -- * Definition
    compositeC056
    -- * Dependencies
  , simple3412
  , simple3413
  ) where

import           Text.Edifact.D96A.Simples (simple3412, simple3413)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C056  DEPARTMENT OR EMPLOYEE DETAILS
-- >
-- >       Desc: Code and/or name of a department or employee. Code
-- >             preferred.
-- >
-- > 010   3413   Department or employee identification         C  an..17
-- > 020   3412   Department or employee                        C  an..35
--
-- Dependencies: 'simple3412', 'simple3413'.
compositeC056 :: Parser Value
compositeC056 =
  composite "C056"
    [ "010" .@ optional  simple3413
    , "020" .@ optional  simple3412
    ]
