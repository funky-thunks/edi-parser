{-# LANGUAGE TupleSections #-}

{-|
Module      : Text.Edifact.Parsing.Combinators
Description : High level combinators
 -}
module Text.Edifact.Parsing.Combinators
  ( -- * Combinators
    -- ** Values parsers
    message
  , segmentGroup
  , segment
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
  ) where

import           Text.Edifact.Parsing.Commons
import           Text.Edifact.Types

import           Text.Parsec                  (lookAhead, many1, optionMaybe,
                                               string, try)
import qualified Text.Parsec                  as P (many)

-- | Parses a 'Message'.
--
-- > messageABCDEF :: Parser Value
-- > messageABCDEF =
-- >   let simple1234 = simple "1234" (alphaNumeric `upTo` 35)
-- >       c101 = composite "C101" [ position "010" (mandatory simple1234)
-- >                               , position "020" (optional  simple1234)
-- >                               ]
-- >       segmentABC = segment "ABC" [ position "010" (mandatory c101)
-- >                                  ]
-- >   in message "ABCDEF" [ position "0010" (mandatory segmentABC)
-- >                       ]
message :: MessageCode -> [Parser (Position, [Value])] -> Parser Value
message code ps =
  let description = "message " <> show code
  in Message code <$> sequence ps <??> description

-- | Parses a 'Group'.
--
-- A Segment Group is the way Edifact format represents hierarchy. One can view
-- a segment group as a sub message. A segment group can be repeated like
-- segments. A segment group wraps segments and segment groups.
segmentGroup :: GroupCode -> [Parser (Position, [Value])] -> Parser Value
segmentGroup code ps =
  let description = "segment-group " <> show code
  in Group code <$> sequence ps <??> description

-- | Parses a 'Segment'.
--
-- Following parser:
--
-- > segmentABC :: Parser Value
-- > segmentABC =
-- >   let simple1234 = simple "1234" (alphaNumeric `upTo` 35)
-- >       simple2001 = simple "2001" (alphaNumeric `exactly` 3)
-- >       c101 = composite "C101" [ position "010" (mandatory simple1234)
-- >                               , position "020" (optional  simple1234)
-- >                               , position "030" (optional  simple1234)
-- >                               ]
-- >   in  segment "ABC" [ position "010" (mandatory simple2001)
-- >                     , position "020" (optional c101)
-- >                     ]
--
-- would parse strings such as:
--
-- >>> parse segmentABC "ABC+123'"
-- Segment "ABC" [ ("010", Just (Simple "2001" "123"))
--               ]
-- >>> parse segmentABC "ABC+123+abcdefgh'"
-- Segment "ABC" [ ("010", Just (Simple "2001" "123"))
--               , ("020", Just (Composite "C101" [ ("010", Just (Simple "1234" "abcdefgh"))
--                                                ]
--                              ))
--               ]
-- >>> parse segmentABC "ABC+123+abcdefgh:ijklmno'"
-- Segment "ABC" [ ("010", Just (Simple "2001" "123"))
--               , ("020", Just (Composite "C101" [ ("010", Just (Simple "1234" "abcdefgh"))
--                                                , ("020", Just (Simple "1234" "ijklmno"))
--                                                ]
--                              ))
--               ]
segment :: SegmentCode -> [Parser (Position, Maybe Value)] -> Parser Value
segment code parsers =
  let go []  = [] <$ parseSegmentSeparator
      go (p:ps) =
        tries [ []  <$  parseSegmentSeparator
              , (:) <$> (parseElementSeparator *> p)
                    <*> go ps
              ]
      description = "segment " <> show code
  in Segment <$>  parseSegmentCode code
             <*>  go parsers
             <??> description

parseSegmentCode :: SegmentCode -> Parser SegmentCode
parseSegmentCode (SegmentCode code) =
  let description = "segment code " <> show code
  in SegmentCode <$> string code <??> description

-- | Parses a 'Composite' element.
--
-- Following parser:
--
-- > compositeC101 :: Parser Value
-- > compositeC101 =
-- >   let simple1234 = simple "1234" (alphaNumeric `upTo` 35)
-- >   in composite "C101" [ position "010" (mandatory simple1234)
-- >                       , position "020" (optional  simple1234)
-- >                       , position "030" (optional  simple1234)
-- >                       ]
--
-- would parse strings such as:
--
-- >>> parse compositeC101 "abcdefgh"
-- Composite "C101" [ ("010", Just (Simple "1234" "abcdefgh"))
--                  ]
-- >>> parse compositeC101 "abcdefgh:ijklmno"
-- Composite "C101" [ ("010", Just (Simple "1234" "abcdefgh"))
--                  , ("020", Just (Simple "1234" "ijklmno"))
--                  ]
-- >>> parse compositeC101 "abcdefgh::pqrstu"
-- Composite "C101" [ ("010", Just (Simple "1234" "abcdefgh"))
--                  , ("020", Just (Simple "1234" ""))
--                  , ("030", Just (Simple "1234" "pqrstu"))
--                  ]
composite :: CompositeCode -> [Parser (Position, Maybe Value)] -> Parser Value
composite code parsers =
  let go []  = pure []
      go (p:ps) = do
        let parseSeparator = tries [ parseCompositeSeparator
                                   , lookAhead parseElementSeparator
                                   , lookAhead parseSegmentSeparator
                                   ]
        (value, continuation) <- tries [ (, ps) <$> p <* parseSeparator
                                       , (, []) <$> p
                                       ]
        (:) value <$> go continuation
      description = "composite element " <> show code
  in Composite code <$> go parsers <??> description

-- | Parses a 'Simple' element.
--
-- Following parser would parse strings of size between 0 and 35 characters.
--
-- > simple1234 :: Parser Value
-- > simple1234 = simple "1234" (alphaNumeric `upTo` 35)
simple :: SimpleCode -> Parser Primitive -> Parser Value
simple code p =
  let description = "simple element " <> show code
  in Simple code <$> p <??> description

-- | Makes the parsing of the element optional, which doesn't consume input if the given parser doesn't succeed.
optional :: Parser Value -> Parser (Maybe Value)
optional = optionMaybe

-- | Makes the parsing of the element mandatory.
mandatory :: Parser Value -> Parser (Maybe Value)
mandatory = fmap Just

-- | Sets the current 'Position'. This is relevant for segment in a message, for composite or simple element in a segment, and for simple element in a composite.
position :: Position -> Parser (f Value) -> Parser (Position, f Value)
position pos p =
  let decorated = (pos,) <$> p
  in setCurrentPosition pos *> decorated <* resetCurrentPosition

-- | Alias to 'position'.
--
-- > compositeC101 :: Parser Value
-- > compositeC101 =
-- >   let simple1234 = simple "1234" (alphaNumeric `upTo` 35)
-- >   in composite "C101" [ "010" .@ mandatory simple1234
-- >                       , "020" .@ optional  simple1234
-- >                       , "030" .@ optional  simple1234
-- >                       ]
(.@) :: Position -> Parser (f Value) -> Parser (Position, f Value)
(.@) = position

-- | Flipped alias to 'position'.
--
-- > compositeC101 :: Parser Value
-- > compositeC101 =
-- >   let simple1234 = simple "1234" (alphaNumeric `upTo` 35)
-- >   in composite "C101" [ mandatory simple1234 @. "010"
-- >                       , optional  simple1234 @. "020"
-- >                       , optional  simple1234 @. "030"
-- >                       ]
(@.) :: Parser (f Value) -> Position -> Parser (Position, f Value)
(@.) = flip position

-- | For segments or segment groups, let you express how many occurrences.
repeated :: Int -> Parser a -> Parser [a]
repeated limit p = do
  values <- P.many (try p)
  let parsed = length values
  if parsed > limit
  then failWithPosition ("expected up to " <> show limit <> " items, but encountered " <> show parsed)
  else pure values

-- | For segments or segment groups, let you express how many occurrences with at least one occurrence.
repeatedAtLeastOnce :: Int -> Parser a -> Parser [a]
repeatedAtLeastOnce limit p = do
  values <- many1 (try p)
  let parsed = length values
  if parsed > limit
  then failWithPosition ("expected up to " <> show limit <> " items, but encountered " <> show parsed)
  else pure values

-- | For segments or segment groups, let you express you expect only one occurrence.
once :: Parser a -> Parser [a]
once = fmap pure

-- | For segments or segment groups, let you express you expect one or no occurrence.
maybeOnce :: Parser a -> Parser [a]
maybeOnce = fmap (maybe [] pure) . optionMaybe
