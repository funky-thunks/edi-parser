module Text.Edifact.Scaffolder.Segments.Specification
  ( -- *
    specificationParser
  , listCompositesAndSimples
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Segments.Types

import           Text.Parsec                            as P (anyChar, choice,
                                                              count, digit,
                                                              endOfLine, many,
                                                              many1, manyTill,
                                                              oneOf, skipMany,
                                                              string, try,
                                                              upper, (<?>))
import           Text.Parsec.String                     (Parser)

specificationParser :: Parser ((SegmentCode, SegmentName), [Dependency])
specificationParser = do
  segmentInfo <- scanUntil [ segmentParser ]
  dependencies <- scan [ inLine dependencyParser ] <?> "Segments specification"
  pure (segmentInfo, dependencies)

listCompositesAndSimples :: Parser (SegmentCode, [Element])
listCompositesAndSimples = do
  parsed <- specificationParser
  pure (fst $ fst parsed, dependencyElement <$> snd parsed)

segmentParser :: Parser (SegmentCode, SegmentName)
segmentParser = do
  _ <- count 6 (oneOf "+*#|X ")
  skipMany (string " ")
  code <- SegmentCode <$> count 3 upper
  _ <- count 2 (string " ")
  skipMany (string " ")
  name <- SegmentName <$> manyTill anyChar (() <$ try endOfLine)
  pure (code, name)

dependencyParser :: Parser Dependency
dependencyParser =
  Dependency <$> positionParser
             <*  many1 (oneOf "+*#|-X ")
             <*> elementParser
             <?> "Dependency"

inLine :: Parser a -> Parser [a]
inLine p = single (many (string " ") *> p)

positionParser :: Parser Position
positionParser =
  fromString <$> count 3 digit
             <?> "Position"

elementParser :: Parser Element
elementParser =
  choice [ compositeParser
         , simpleParser
         ]
         <?> "Element"

compositeParser :: Parser Element
compositeParser = Composite <$> compositeCodeParser
                      <*  many (string " ")
                      <*> stringToPresenceParser
                      <*  many1 (string " ")
                      <*> presenceParser
                      <*  string " "
                      <*  many (oneOf " 0123456789")
                      <?> "Composite"

simpleParser :: Parser Element
simpleParser = Simple <$> (fromString <$> count 4 digit)
                      <*  many1 (string " ")
                      <*> stringToPresenceParser
                      <*  many1 (string " ")
                      <*> presenceParser
                      <*  string "  "
                      <*  many (oneOf " 0123456789")
                      <*> simpleTypeParser
                      <*> simpleLengthParser
                      <?> "Simple"

simpleTypeParser :: Parser SimpleType
simpleTypeParser = choice [ Alphanumeric <$ string "an"
                          , Alphabetic   <$ string "a"
                          , Numeric      <$ string "n"
                          ] <?> "SimpleType"

simpleLengthParser :: Parser SimpleLength
simpleLengthParser = choice [ UpTo <$> fmap fromString (string ".." >> many1 digit)
                            , Exactly <$> (fromString <$> many1 digit)
                            ] <?> "SimpleLength"

compositeCodeParser :: Parser CompositeCode
compositeCodeParser = do
  initial <- oneOf "CE"
  rest <- count 3 digit
  pure (fromString (initial : rest))
