{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.BundleReader.Segments
  ( readSegments
  , segmentsDirectory
  ) where

import           Text.Edifact.BundleReader.Commons
import           Text.Edifact.BundleReader.Configuration        (BundleReaderEnv (..))
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Segments.Specification (listCompositesAndSimples)
import           Text.Edifact.Scaffolder.Segments.Types         (Element,
                                                                 getComposite,
                                                                 getSimple)

import           Control.Monad                                  (when)
import           Control.Monad.Reader                           (asks)
import           Data.Bifunctor                                 (bimap)
import           Data.ByteString                                as BS (ByteString,
                                                                       readFile)
import           Data.List                                      as L (partition)
import           Data.Maybe                                     (isJust,
                                                                 mapMaybe)
import           Formatting

segmentsDirectory :: FilePath
segmentsDirectory = "segments"

readSegments :: [ByteString] -> [SegmentCode] -> BundleReader ([CompositeCode], [SimpleCode])
readSegments contents segments = do
  let parsedFile path = parseFile segments =<< liftIO (BS.readFile path)
      parsedString = parseFile segments
  files <- asks segmentsFiles
  parsedFiles <- traverse parsedFile files
  parsedStrings <- traverse parsedString contents
  let filtered = concatMap snd $ filter (\s -> fst s `elem` segments) $ concat (parsedFiles <> parsedStrings)
  pure $ partitionElements filtered

parseFile :: [SegmentCode] -> ByteString -> BundleReader [(SegmentCode, [Element])]
parseFile segments content =
  let chunks = tail $ splitFileByDash 70 $ decodeContent content
  in traverse (parseChunk segments) chunks

parseChunk :: [SegmentCode] -> Text -> BundleReader (SegmentCode, [Element])
parseChunk segments chunk = do
  parsed <- parseOrFail chunk listCompositesAndSimples
  outputFile <- getOutputFile (fSegmentCodeLower % ".txt") segmentsDirectory (fst parsed)
  when (fst parsed `elem` segments) $ toFile chunk outputFile
  pure parsed

partitionElements :: [Element] -> ([CompositeCode], [SimpleCode])
partitionElements =
  let isComposite = isJust . getComposite
  in bimap (mapMaybe getComposite) (mapMaybe getSimple) . partition isComposite
