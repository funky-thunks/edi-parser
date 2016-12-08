{-# LANGUAGE OverloadedStrings #-}

module ParsingTest
  ( suite
  ) where

import qualified Parsing.CombinatorsTest as Combinators (suite)
import qualified Parsing.PrimitivesTest  as Primitives (suite)

import           Test.Framework

suite :: Test
suite =
  testGroup "Parsing"
    [ Combinators.suite
    , Primitives.suite
    ]
