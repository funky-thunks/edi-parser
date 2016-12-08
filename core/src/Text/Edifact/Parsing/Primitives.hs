{-|
Module      : Text.Edifact.Parsing.Primitives
Description : Low level combinators

This module let you build parsers for primitive values, ie. values contained
in a simple element, either text or number.

= Examples

To parse a text of 3 characters (@an3@ in standard Edifact representation):

> an3 :: Parser Primitive
> an3 = alphaNumeric `exactly` 3

To parse a text of up to 10 characters (@an..10@ in standard Edifact representation):

> an_10 :: Parser Primitive
> an_10 = alphaNumeric `upTo` 10

= Known limitations

Numeric representation is not strictly compatible to the specification.
The specification tells that negative sign (@-@) and decimal sign (@.@) are not
to be counted in the length of the field.

Therefore the following parser will fail even it's legal according to the
specification:

> n_3 :: Parser Primitive
> n_3 = numeric `upTo` 3
>
> parse n_3 "-12.3"

To be fixed, we have to change the way primitives combinators are built so that
the 'upTo' and 'exactly' combinators are aware of the inner parser.
 -}
module Text.Edifact.Parsing.Primitives
  (
    -- * Primitives
    -- ** Simple elements definition
    alphaNumeric
  , alpha
  , numeric

    -- ** Cardinality
  , exactly
  , upTo
  , many

  ) where

import           Text.Edifact.Parsing.Commons
import           Text.Edifact.Types

import           Data.String                  (fromString)
import qualified Data.Text                    as T (length)
import           Text.Parsec                  (count, lookAhead, many1, noneOf,
                                               oneOf)
import qualified Text.Parsec                  as P (many)

-- | Parser associated with the @an@ notation.
alphaNumeric :: Parser Char
alphaNumeric = do
  separators <- sequence [ getSegmentSeparator
                         , getElementSeparator
                         , getCompositeSeparator
                         ]
  tries [ parseEscape *> parseSegmentSeparator
        , parseEscape *> parseElementSeparator
        , parseEscape *> parseCompositeSeparator
        , parseEscape *> parseEscape
        , noneOf separators
        ]

-- | Parser associated with the @a@ notation.
--
-- So far it's simply an alias to 'alphaNumeric'.
alpha :: Parser Char
alpha = alphaNumeric

-- | Parser associated with the @n@ notation.
numeric :: Parser Char
numeric = do
  punctuationSign <- getDecimalSign
  oneOf (punctuationSign : "0123456789-")

-- | Combinator to build a parser of primitive which length is unspecified.
--
-- Correspondance with the Edifact notation:
--
-- > many alpha        # same as a
-- > many numeric      # same as n
-- > many alphaNumeric # same as an
many :: Parser Char -> Parser Primitive
many = fmap fromString . many1

-- | Combinator to build a parser of primitive which length is capped.
--
-- Correspondance with the Edifact notation:
--
-- > alpha `upTo` 3        # same as a..3
-- > numeric `upTo` 3      # same as n..3
-- > alphaNumeric `upTo` 3 # same as an..3
upTo :: Parser Char -> Int -> Parser Primitive
upTo p c =
  let check t =
        let c' = T.length t
        in if c' > c
           then failWithPosition ("expected up to " <> show c <> " characters, but encountered " <> show c')
           else pure (String t)
      maybeEmpty = (<$) mempty . lookAhead
  in check =<<
       tries [ maybeEmpty parseSegmentSeparator
             , maybeEmpty parseElementSeparator
             , maybeEmpty parseCompositeSeparator
             , fromString <$> P.many p
             ]

-- | Combinator to build a parser of primitive which length is fixed.
--
-- Correspondance with the Edifact notation:
--
-- > alpha `exactly` 3        # same as a3
-- > numeric `exactly` 3      # same as n3
-- > alphaNumeric `exactly` 3 # same as an3
exactly :: Parser Char -> Int -> Parser Primitive
exactly p c = fromString <$> count c p
