module Text.Edifact.Scaffolder.Composites.Specification
  ( -- *
    specificationParser
  , listSimples
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Composites.Types

import           Text.Parsec                              as P (anyChar, count,
                                                                digit,
                                                                endOfLine, many,
                                                                many1, manyTill,
                                                                oneOf, skipMany,
                                                                string, try,
                                                                (<?>))
import           Text.Parsec.String                       (Parser)

specificationParser :: Parser ((CompositeCode, CompositeName), [Dependency])
specificationParser = do
  compositeInfo <- scanUntil [ compositeParser ]
  dependencies <- scan [ inLine dependencyParser ] <?> "Composites specification"
  pure (compositeInfo, dependencies)

listSimples :: Parser (CompositeCode, [SimpleCode])
listSimples = do
  parsed <- specificationParser
  pure (fst $ fst parsed, getElementSimpleCode . dependencyElement <$> snd parsed)

compositeParser :: Parser (CompositeCode, CompositeName)
compositeParser = do
  _ <- count 6 (oneOf "+*#|X ")
  skipMany (string " ")
  code <- compositeCodeParser
  _ <- string " "
  name <- CompositeName <$> manyTill anyChar (() <$ try endOfLine)
  pure (code, name)

compositeCodeParser :: Parser CompositeCode
compositeCodeParser = do
  initial <- oneOf "CE"
  rest <- count 3 digit
  pure (fromString (initial : rest))

dependencyParser :: Parser Dependency
dependencyParser =
  Dependency <$> positionParser
             <*  many1 (oneOf "+*#|-X ")
             <*> elementParser
             <*  stringToPresenceParser
             <*  many1 (string " ")
             <*> presenceParser
             <?> "Dependency"

inLine :: Parser a -> Parser [a]
inLine p = single (many (string " ") *> p <* filler)

filler :: Parser ()
filler = () <$ many (oneOf "an.0123456789 ")

positionParser :: Parser Position
positionParser =
  fromString <$> count 3 digit
             <?> "Position"

elementParser :: Parser Element
elementParser =
  fromString <$> count 4 digit
             <?> "Element"
