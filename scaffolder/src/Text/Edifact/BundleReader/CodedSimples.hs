{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.BundleReader.CodedSimples
  ( readCodedSimples
  ) where

import           Text.Edifact.BundleReader.Commons
import           Text.Edifact.BundleReader.Configuration           (BundleReaderEnv (..))
import           Text.Edifact.BundleReader.Simples                 (simplesDirectory)
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.CodedSimples.Specification

import           Control.Monad                                     (when)
import           Control.Monad.Reader                              (asks)
import           Data.ByteString                                   as BS (ByteString,
                                                                          readFile)
import           Formatting

readCodedSimples :: [ByteString] -> [SimpleCode] -> BundleReader ()
readCodedSimples contents simples = do
  let parsedFile path = parseFile simples =<< liftIO (BS.readFile path)
      parsedString = parseFile simples
  files <- asks codedSimplesFiles
  mapM_ parsedFile files
  mapM_ parsedString contents

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
