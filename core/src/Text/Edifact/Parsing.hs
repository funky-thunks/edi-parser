{-|
Module      : Text.Edifact.Parsing
Description : Parsing routines and combinators

This module is there to reexport most of the combinators and helpers required
to parse an Edifact payload.

For high level combinators, have a look at "Text.Edifact.Parsing.Combinators".

For low level combinators, have a look at "Text.Edifact.Parsing.Primitives".
 -}
module Text.Edifact.Parsing
  (
    -- * Parsing routines
    parse

    -- * Combinators
    -- | See "Text.Edifact.Parsing.Combinators" for more details

    -- ** Values parsers
  , message
  , segment
  , segmentGroup
  , composite
  , simple

    -- ** Position and strictness
  , position
  , (.@)
  , (@.)
  , mandatory
  , optional

    -- ** Repetition of segments and segment groups
  , repeated
  , repeatedAtLeastOnce
  , once
  , maybeOnce

    -- * Primitives
    -- | See "Text.Edifact.Parsing.Primitives" for more details and known limitations.

    -- ** Simple elements definition
  , alphaNumeric
  , alpha
  , numeric
    -- ** Cardinality
  , exactly
  , upTo
  , many

    -- * Types
  , Parser
    -- ** Reexported
  , ParseError
  ) where

import           Text.Edifact.Parsing.Combinators (composite, mandatory,
                                                   maybeOnce, message, once,
                                                   optional, position, repeated,
                                                   repeatedAtLeastOnce, segment,
                                                   segmentGroup, simple, (.@),
                                                   (@.))
import           Text.Edifact.Parsing.Commons     (Parser, defaultContext)
import           Text.Edifact.Parsing.Primitives  (alpha, alphaNumeric, exactly,
                                                   many, numeric, upTo)

import           Data.Text                        (Text)
import           Text.Parsec                      (ParseError, runParser)

parse :: Parser value -> Text -> Either ParseError value
parse p = runParser p defaultContext ""
