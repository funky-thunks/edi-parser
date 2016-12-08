{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TupleSections    #-}

module Text.Edifact.Scaffolder.Commons.Parsing
  ( -- *
    maybeParse
  , skipBeginning
  , single
  , silent
    -- *
  , listElements
    -- *
  , presenceParser
  , stringToPresenceParser
    -- *
  , messageCodeParser
    -- *
  , scanDependencies
  , scan
  , scanUntil
  ) where

import           Text.Edifact.Scaffolder.Commons.Logging (say)
import           Text.Edifact.Scaffolder.Commons.Types

import           Control.Monad.IO.Class                  (liftIO)
import           Control.Monad.Identity                  (Identity)
import           Control.Monad.Reader                    (asks, local)
import           Data.Bifunctor                          (first)
import           Data.List                               (sort)
import           Data.List.NonEmpty                      (NonEmpty, nonEmpty)
import           Data.Maybe                              (catMaybes)
import           Data.String                             (fromString)
import           Data.Text                               (Text)
import           Formatting                              as F (shown)
import           System.Directory                        (listDirectory)
import           System.FilePath                         ((</>))
import           Text.Parsec                             (Parsec, SourceName,
                                                          Stream, anyChar, char,
                                                          choice, count,
                                                          endOfLine, eof,
                                                          lookAhead, many,
                                                          many1, manyTill,
                                                          oneOf, optionMaybe,
                                                          runParser, string,
                                                          try, upper, (<?>))

maybeParse :: (Show a, Stream s Identity t, Monoid u) => SourceName -> Parsec s u a -> s -> Scaffolding (Maybe a)
maybeParse source parser input =
  let interpretParsingResult (Right v) _     = pure (Just v)
      interpretParsingResult e         True  = Nothing <$ say shown e
      interpretParsingResult _         False = pure Nothing
      shouldDebug = asks debugParsing
  in shouldDebug >>= interpretParsingResult (runParser parser mempty source input)

-- | Disable parsing error logging locally
silent :: Scaffolding a -> Scaffolding a
silent = local disableDebugging

-- | Let you traverse a directory and filter files matching a parser.
-- The filename is then paired with the matched value
listElements :: (Show elt, Ord elt) => FilePath -> Parsec String () elt -> Scaffolding [(FilePath, elt)]
listElements subpath parser = do
  home <- getSpecificationHome
  let directory = home </> subpath
  files <- sort <$> liftIO (listDirectory directory)
  let prependDirectory f = directory </> f
  fmap (first prependDirectory) . catMaybes <$> traverse (extractElement parser) files

getSpecificationHome :: Scaffolding FilePath
getSpecificationHome =
  let concatenate path (Revision rev) = path </> rev
  in asks (concatenate . specificationsHome) <*> asks revision

extractElement :: Show elt => Parsec String () elt -> FilePath -> Scaffolding (Maybe (FilePath, elt))
extractElement parser path = silent (fmap (path,) <$> maybeParse path parser path)

skipBeginning :: Stream s Identity Char => Parsec s () a -> Parsec s () a
skipBeginning p = manyTill anyChar (try (lookAhead p)) *> p

single :: Stream s Identity Char => Parsec s u a -> Parsec s u [a]
single = count 1

presenceParser :: Stream s Identity Char => Parsec s u Presence
presenceParser =
  choice [ Mandatory <$ char 'M'
         , Optional  <$ char 'C'
         ] <?> "Presence"

stringToPresenceParser :: Stream s Identity Char => Parsec s u Text
stringToPresenceParser = fromString <$>
        manyTill anyChar (try $ lookAhead $ many1 (string " ") >> presenceParser >> string " " >> many (oneOf " 0123456789"))
        <?> "Description"

messageCodeParser :: Stream s Identity Char => Parsec s u MessageCode
messageCodeParser = fromString <$> count 6 upper

scanDependencies :: (Monoid u, Show result) => FilePath -> Parsec String u [result] -> Scaffolding (Maybe (NonEmpty result))
scanDependencies file parser =
  let readLines = liftIO (readFile file)
  in readLines >>= fmap (nonEmpty =<<) . maybeParse file parser

scan :: Stream s Identity Char => [Parsec s u [a]] -> Parsec s u [a]
scan scanners =
  let parsers = (scanLine <$> scanners) <> [skipLine]
      end = choice [ () <$ try endOfLine
                   , () <$ eof
                   ]
      scanLine p = optionMaybe (try p) <* end
      skipLine = Nothing <$ manyTill anyChar end
  in concat . catMaybes <$> manyTill (choice parsers) eof

scanUntil :: Stream s Identity Char => [Parsec s u a] -> Parsec s u a
scanUntil scanners =
  let parsers = scanLine <$> scanners
      end = choice [ () <$ try endOfLine
                   , () <$ eof
                   ]
      searching = choice $ fmap (() <$) parsers <> [ () <$ eof ]
      scanLine p = p <* end
      skipLine = manyTill anyChar end
  in manyTill skipLine (try $ lookAhead searching) >> try (choice parsers)
