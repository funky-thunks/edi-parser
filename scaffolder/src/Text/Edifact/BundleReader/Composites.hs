{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.BundleReader.Composites
  ( readComposites
  , compositesDirectory
  ) where

import           Text.Edifact.BundleReader.Commons
import           Text.Edifact.BundleReader.Configuration          (BundleReaderEnv (..))
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Composites.Specification (listSimples)

import           Control.Monad                                    (when)
import           Control.Monad.Reader                             (asks)
import           Data.ByteString                                  as BS (ByteString,
                                                                         readFile)
import           Formatting

compositesDirectory :: FilePath
compositesDirectory = "composites"

readComposites :: [ByteString] -> ([CompositeCode], [SimpleCode]) -> BundleReader [SimpleCode]
readComposites contents (composites, simples) = do
  let parsedFile path = parseFile composites =<< liftIO (BS.readFile path)
      parsedString = parseFile composites
  files <- asks compositesFiles
  parsedFiles <- traverse parsedFile files
  parsedStrings <- traverse parsedString contents
  let filtered = mappend simples $ concatMap snd $ filter (\s -> fst s `elem` composites) $ concat (parsedFiles <> parsedStrings)
  pure filtered

parseFile :: [CompositeCode] -> ByteString -> BundleReader [(CompositeCode, [SimpleCode])]
parseFile composites content =
  let chunks = tail $ splitFileByDash 70 $ decodeContent content
  in traverse (parseChunk composites) chunks

parseChunk :: [CompositeCode] -> Text -> BundleReader (CompositeCode, [SimpleCode])
parseChunk composites chunk = do
  parsed <- parseOrFail chunk listSimples
  outputFile <- getOutputFile (fCompositeCodeLower % ".txt") compositesDirectory (fst parsed)
  when (fst parsed `elem` composites) $ toFile chunk outputFile
  pure parsed
