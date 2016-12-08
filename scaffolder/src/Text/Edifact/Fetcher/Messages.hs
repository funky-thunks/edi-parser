{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Fetcher.Messages
  ( fetchMessages
  , messagesDirectory
  ) where

import           Text.Edifact.Fetcher.Commons
import           Text.Edifact.Fetcher.Configuration
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Messages.Specification (listSegments)

import           Data.Foldable                                  (toList)
import           Data.List                                      as L (nub, sort)
import           Data.Maybe                                     (mapMaybe)
import           Data.Text                                      as T (map)
import           Data.Text.Encoding                             as TE (decodeLatin1,
                                                                       decodeUtf8)
import           Formatting
import           Text.Pandoc                                    as Pandoc hiding (Format,
                                                                           getOutputFile)
import           Text.Pandoc.Walk                               (query)
import           Text.Parsec                                    (parse)

messagesDirectory :: FilePath
messagesDirectory = "messages"

parseMessageCode :: Text -> Maybe MessageCode
parseMessageCode =
  let toMaybe (Right v) = Just v
      toMaybe _         = Nothing
  in toMaybe . parse messageCodeParser ""

scanInlineForMessageCode :: Inline -> Maybe MessageCode
scanInlineForMessageCode (Str label) = parseMessageCode label
scanInlineForMessageCode _           = Nothing

-- The trick here is to reverse the usage of UNH which is mandatory on every single message
listAllMessages :: Fetcher [MessageCode]
listAllMessages =
  let filterLink (Link _ inlines _) = mapMaybe scanInlineForMessageCode inlines
      filterLink _                  = []
      extractMessageCodes = query filterLink
      loadUNHUsages = readHtmlFromURL TE.decodeUtf8 =<< getUrl ("/trsd/cseg" % fSegmentCodeLower % ".htm") "UNH"
  in extractMessageCodes <$> loadUNHUsages

listMessages :: Fetcher [MessageCode]
listMessages = getSelectedMessages >>= maybe listAllMessages (pure . toList)

fetchMessages :: Fetcher [SegmentCode]
fetchMessages = listMessages >>= fmap (L.nub . L.sort . concat) . traverse fetchMessage

fetchMessage :: MessageCode -> Fetcher [SegmentCode]
fetchMessage code = do
  retry 3 (fetchMessageDefinition code)
  retry 3 (fetchMessageSummary code)

fetchMessageDefinition :: MessageCode -> Fetcher ()
fetchMessageDefinition code = do
  say ("Fetching message " % fMessageCode % " definition") code
  url <- getUrl ("/trmd/" % fMessageCodeLower % "_d.htm") code
  outputFile <- getOutputFile (fMessageCodeLower % "_d.txt") messagesDirectory code
  htmlToFile url TE.decodeUtf8 outputFile

fetchMessageSummary :: MessageCode -> Fetcher [SegmentCode]
fetchMessageSummary code = do
  say ("Fetching message " % fMessageCode % " summary") code
  url <- getUrl ("/trmd/" % fMessageCodeLower % "_s.htm") code
  outputFile <- getOutputFile (fMessageCodeLower % "_s.txt") messagesDirectory code
  let decoder = cleanupAsciiArt . TE.decodeLatin1
  htmlToFileWithParser url decoder outputFile listSegments

-- This might not be the proper way to do it...
-- Use Data.Text.Encoding.decodeUtf8With instead?
cleanupAsciiArt :: Text -> Text
cleanupAsciiArt =
  let f 'Ä' = '-'
      f '¿' = '+'
      f '³' = '|'
      f 'Ù' = '+'
      f 'Á' = '+'
      f c   = c
  in T.map f
