{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Fetcher.Composites
  ( fetchComposites
  , compositesDirectory
  ) where

import           Text.Edifact.Fetcher.Commons
import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Composites.Specification (listSimples)

import           Data.List                                        as L (nub,
                                                                        sort)
import           Data.Text.Encoding                               as TE (decodeUtf8)
import           Formatting

compositesDirectory :: FilePath
compositesDirectory = "composites"

fetchComposites :: ([CompositeCode], [SimpleCode]) -> Fetcher [SimpleCode]
fetchComposites (composites, segments) =
  let compactSimpleCodes = L.nub . L.sort . mappend segments . concat
  in compactSimpleCodes <$> traverse (retry 3 . fetchComposite) composites

fetchComposite :: CompositeCode -> Fetcher [SimpleCode]
fetchComposite code = do
  say ("Fetching composite " % fCompositeCode) code
  url <- getUrl ("/trcd/trcd" % fCompositeCodeLower % ".htm") code
  outputFile <- getOutputFile (fCompositeCodeLower % ".txt") compositesDirectory code
  htmlToFileWithParser url TE.decodeUtf8 outputFile (snd <$> listSimples)
