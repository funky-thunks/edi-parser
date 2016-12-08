{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.BundleReader.Commons where

import           Text.Edifact.BundleReader.Configuration
import           Text.Edifact.Scaffolder.Commons

import           Control.Monad.Reader                    (ReaderT, runReaderT)
import           Data.ByteString                         (ByteString)
import           Data.Char                               (toLower)
import           Data.List.Split                         (splitWhen)
import           Data.Text                               as T (isInfixOf, lines,
                                                               map, null,
                                                               replicate, strip,
                                                               unlines, unpack)
import           Data.Text.Encoding                      as TE (decodeLatin1,
                                                                decodeUtf8')
import           Data.Text.IO                            as TIO (writeFile)
import           Formatting
import           Text.Parsec                             (Parsec, runParser)

type BundleReader = ReaderT BundleReaderEnv IO

decodeContent :: ByteString -> Text
decodeContent content = either (const $ cleanupAsciiArt $ decodeLatin1 content) id (decodeUtf8' content)

splitFileByDash :: Int -> Text -> [Text]
splitFileByDash n =
  let separator = T.replicate n "-"
      isNotEmpty = not . T.null . T.strip
  in
    filter isNotEmpty . fmap T.unlines . splitWhen (separator `T.isInfixOf`) . T.lines

runBundleReader :: BundleReader () -> BundleReaderEnv -> IO ()
runBundleReader = runReaderT

getOutputFile :: Format String (a -> String) -> FilePath -> a -> BundleReader FilePath
getOutputFile f d c = do
  home <- getSpecificationHome
  pure (formatToString (string % "/" % string % "/" % f) home d c)

getSpecificationHome :: BundleReader FilePath
getSpecificationHome = do
  home <- getHome
  rev <- getTargetRevision
  pure (home </> formatToString fRevision rev)

toFile :: Text -> FilePath -> BundleReader ()
toFile specification outputFile = liftIO (TIO.writeFile outputFile specification)

parseOrFail :: (Monoid u) => Text -> Parsec String u a -> BundleReader a
parseOrFail specification parser = either (error . (\a -> show specification <> show a)) pure (runParser parser mempty "" (T.unpack specification))

toFileWithParser :: (Monoid a, Monoid u) => Text -> FilePath -> Parsec String u a -> BundleReader a
toFileWithParser specification outputFile parser = do
  liftIO (TIO.writeFile outputFile specification)
  either (error . show) pure (runParser parser mempty "" (T.unpack specification))

lower :: Format r (String -> r)
lower = mapf (fmap toLower) string

fRevision :: Format r (Revision -> r)
fRevision = mapf getRevision string

fRevisionLower :: Format r (Revision -> r)
fRevisionLower = mapf getRevision lower

fMessageCodeLower :: Format r (MessageCode -> r)
fMessageCodeLower = mapf getMessageCode lower

fSegmentCodeLower :: Format r (SegmentCode -> r)
fSegmentCodeLower = mapf getSegmentCode lower

fCompositeCodeLower :: Format r (CompositeCode -> r)
fCompositeCodeLower = mapf getCompositeCode lower

fSimpleCodeLower :: Format r (SimpleCode -> r)
fSimpleCodeLower = mapf getSimpleCode lower

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
