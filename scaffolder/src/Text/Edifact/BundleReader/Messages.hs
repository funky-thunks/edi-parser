{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections     #-}

module Text.Edifact.BundleReader.Messages
  ( readMessages
  , messagesDirectory
  ) where

import           Text.Edifact.BundleReader.Commons              (BundleReader,
                                                                 decodeContent,
                                                                 fMessageCodeLower,
                                                                 getOutputFile,
                                                                 parseOrFail,
                                                                 toFile)
import           Text.Edifact.BundleReader.Configuration        (BundleReaderEnv (..))
import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Messages.Specification (listSegments, messageNameParser)

import           Control.Monad                                  (when)
import           Control.Monad.Reader                           (asks)
import           Data.ByteString                                as BS (ByteString,
                                                                       readFile)
import qualified Data.Text                                      as T (isPrefixOf,
                                                                      lines,
                                                                      unlines)
import           Formatting

messagesDirectory :: FilePath
messagesDirectory = "messages"

readMessages :: [ByteString] -> BundleReader [(MessageCode, [SegmentCode])]
readMessages contents = do
  selectedMessages <- asks messageNames
  let parsedFile path = parseFile selectedMessages =<< liftIO (BS.readFile path)
      parsedString = parseFile selectedMessages
  parsedFiles <- traverse parsedFile =<< asks messagesFiles
  parsedStrings <- traverse parsedString contents
  let filtered = parsedFiles <> filter (\s -> null selectedMessages || fst s `elem` selectedMessages) parsedStrings
  pure filtered

parseFile :: [MessageCode] -> ByteString -> BundleReader (MessageCode, [SegmentCode])
parseFile selectedMessages content = do
  let (definition, summary) = splitFile $ decodeContent content
  messageCode <- parseOrFail definition messageNameParser
  summaryOutputFile <- getOutputFile (fMessageCodeLower % "_s.txt") messagesDirectory messageCode
  definitionOutputFile <- getOutputFile (fMessageCodeLower % "_d.txt") messagesDirectory messageCode
  when (messageCode `elem` selectedMessages) $ toFile definition definitionOutputFile
  when (messageCode `elem` selectedMessages) $ toFile summary summaryOutputFile
  (messageCode,) <$> parseOrFail summary listSegments

splitFile :: Text -> (Text, Text)
splitFile content = let
  separatorBefore = "4.3    Message structure"
  separatorAfter  = "Annex"
  textBefore = takeWhile (not . T.isPrefixOf separatorBefore) $ T.lines content
  textInsideAndAfter = dropWhile (not . T.isPrefixOf separatorBefore) $ T.lines content
  textAfter = dropWhile (not . T.isPrefixOf separatorAfter) textInsideAndAfter
  textSummary = T.unlines $ takeWhile (not . T.isPrefixOf separatorAfter) textInsideAndAfter
  textDefinition = T.unlines $ textBefore <> [separatorBefore, "", "See summary file", ""] <> textAfter
  in
    (textDefinition, textSummary)
