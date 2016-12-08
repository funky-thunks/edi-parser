{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.BundleReader.Simples
  ( readSimples
  , simplesDirectory
  ) where

import           Text.Edifact.BundleReader.Commons
import           Text.Edifact.BundleReader.Configuration       (BundleReaderEnv (..))
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Simples.Specification

import           Control.Monad                                 (when)
import           Control.Monad.Reader                          (asks)
import           Data.ByteString                               as BS (ByteString,
                                                                      readFile)
import           Formatting

simplesDirectory :: FilePath
simplesDirectory = "simples"

readSimples :: [ByteString] -> [SimpleCode] -> BundleReader [SimpleCode]
readSimples contents simples = do
  let parsedFile path = parseFile simples =<< liftIO (BS.readFile path)
      parsedString = parseFile simples
  files <- asks simplesFiles
  parsedFiles <- traverse parsedFile files
  parsedStrings <- traverse parsedString contents
  let filtered = filter (`elem` simples) $ concat (parsedFiles <> parsedStrings)
  pure filtered

parseFile :: [SimpleCode] -> ByteString -> BundleReader [SimpleCode]
parseFile simples content =
  let chunks = tail $ splitFileByDash 70 $ decodeContent content
  in traverse (parseChunk simples) chunks

parseChunk :: [SimpleCode] -> Text -> BundleReader SimpleCode
parseChunk simples chunk = do
  parsed <- parseOrFail chunk specificationParser
  outputFile <- getOutputFile (fSimpleCodeLower % ".txt") simplesDirectory (fst parsed)
  when (fst parsed `elem` simples) $ toFile chunk outputFile
  pure $ fst parsed
