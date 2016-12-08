{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Fetcher.Segments
  ( fetchSegments
  , segmentsDirectory
  ) where

import           Text.Edifact.Fetcher.Commons
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Segments.Specification (listCompositesAndSimples)
import           Text.Edifact.Scaffolder.Segments.Types         (Element,
                                                                 getComposite,
                                                                 getSimple)

import           Data.Bifunctor                                 (bimap)
import           Data.List                                      as L (nub,
                                                                      partition,
                                                                      sort)
import           Data.Maybe                                     (isJust,
                                                                 mapMaybe)
import           Data.Text.Encoding                             as TE (decodeUtf8)
import           Formatting

segmentsDirectory :: FilePath
segmentsDirectory = "segments"

fetchSegments :: [SegmentCode] -> Fetcher ([CompositeCode], [SimpleCode])
fetchSegments = fmap (partitionElements . L.nub . L.sort . concat) . traverse (retry 3 . fetchSegment)

partitionElements :: [Element] -> ([CompositeCode], [SimpleCode])
partitionElements =
  let isComposite = isJust . getComposite
  in bimap (mapMaybe getComposite) (mapMaybe getSimple) . partition isComposite

fetchSegment :: SegmentCode -> Fetcher [Element]
fetchSegment code = do
  say ("Fetching segment " % fSegmentCode) code
  url <- getUrl ("/trsd/trsd" % fSegmentCodeLower % ".htm") code
  outputFile <- getOutputFile (fSegmentCodeLower % ".txt") segmentsDirectory code
  htmlToFileWithParser url TE.decodeUtf8 outputFile (snd <$> listCompositesAndSimples)
