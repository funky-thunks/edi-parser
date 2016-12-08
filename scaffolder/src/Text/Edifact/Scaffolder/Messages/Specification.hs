{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Text.Edifact.Scaffolder.Messages.Specification
  ( -- *
    specificationParser
  , messageNameParser
  , listSegments
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Messages.Types

import           Data.Maybe                             (mapMaybe)
import           Text.Parsec

type Parser = Parsec String GroupTrail

newtype GroupTrail = GroupTrail [GroupCode]
  deriving stock Show
  deriving newtype (Semigroup, Monoid)

messageNameParser :: Parser MessageCode
messageNameParser = scanUntil [
    manyTill anyChar (string "Message Type : ") >> MessageCode <$> count 6 upper
  ]

specificationParser :: Parser [Dependency]
specificationParser =
  let scanElements = scan [ segmentInLine segmentElementParser
                          , groupInLine   groupStartElementParser
                          ]
  in interpretDependencies <$> scanElements <?> "Messages specification"

listSegments :: Parser [SegmentCode]
listSegments = mapMaybe (getSegment . getElement) <$> specificationParser

interpretDependencies :: [Element] -> [Dependency]
interpretDependencies = fmap Dependency

groupInLine :: Parser a -> Parser [a]
groupInLine p = single (many (string " ") *> p <* countClosingGroups)

countClosingGroups :: Parser Int
countClosingGroups =
  let parser = many1 (char '-')
            *> many1 (char '+')
           <*  many  (char '|')
  in length <$> parser

closingGroupTrail :: Parser [Element]
closingGroupTrail =
  let groupEndParser = GroupEnd <$> popFromTrail
  in countClosingGroups >>= flip count groupEndParser

groupStartElementParser :: Parser Element
groupStartElementParser =
  let parseStart pos code rep = GroupStart code (Positional pos rep)
  in parseStart <$> positionParser
                <*  many1 (choice [ () <$ try (oneOf "+*#|X "), () <$ try (string "- ") ])
                <*> groupCodeParser
                <*  many1 (char ' ')
                <*> repetitionParser
                <?> "GroupElement"

groupCodeParser :: Parser GroupCode
groupCodeParser =
  let parser = manyTill (char '-') (try $ string "-- Segment group")
            *> many1 (char ' ')
            *> many1 digit
           <*  many1 space
           <*  many1 (char '-')
      group = GroupCode <$> parser
  in group >>= appendToTrail <?> "GroupCodeParser"

appendToTrail :: GroupCode -> Parser GroupCode
appendToTrail code =
  let append (GroupTrail trail) = GroupTrail (code : trail)
  in code <$ modifyState append

popFromTrail :: Parser GroupCode
popFromTrail = do
  previous <- getState
  case previous of
    GroupTrail (current : trail) -> current <$ putState (GroupTrail trail)
    GroupTrail []                -> unexpected "GroupEnd, when state is currently clear"

segmentTrail :: Parser [a]
segmentTrail = [] <$ (many1 (char ' ') <* many (char '|'))

segmentInLine :: Parser Element -> Parser [Element]
segmentInLine p = do
  segment <- many (string " ") *> p
  trail <- choice [ try closingGroupTrail
                  , try segmentTrail
                  ]
  pure (segment : trail)

repetitionParser :: Parser Repetition
repetitionParser =
  Repetition <$> presenceParser
             <*  many1 (string " ")
             <*> cardinalityParser
             <?> "Repetition"

positionParser :: Parser Position
positionParser =
  fromString <$> many1 digit
             <?> "Position"

segmentElementParser :: Parser Element
segmentElementParser =
  let parseSegment pos code rep = Segment code (Positional pos rep)
  in parseSegment <$> positionParser
                  <*  many1 (oneOf "+*#|-X ")
                  <*> segmentCodeParser
                  <*  many1 (string " ")
                  <*  stringToPresenceParser
                  <*  many1 (string " ")
                  <*> repetitionParser
                  <?> "SegmentElement"

segmentCodeParser :: Parser SegmentCode
segmentCodeParser =
  fromString <$> count 3 upper
             <?> "SegmentCode"

cardinalityParser :: Parser Cardinality
cardinalityParser = Cardinality . read <$> many1 digit
