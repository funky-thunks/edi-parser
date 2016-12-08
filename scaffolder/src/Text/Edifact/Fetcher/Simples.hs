{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Fetcher.Simples
  ( fetchSimples
  , simplesDirectory
  ) where

import           Text.Edifact.Fetcher.Commons
import           Text.Edifact.Scaffolder.Commons


import           Data.Foldable                   (traverse_)
import           Data.Text.Encoding              as TE (decodeUtf8)
import           Formatting

simplesDirectory :: FilePath
simplesDirectory = "simples"

fetchSimples :: [SimpleCode] -> Fetcher ()
fetchSimples = traverse_ (retry 3 . fetchSimple)

fetchSimple :: SimpleCode -> Fetcher ()
fetchSimple code = do
  say ("Fetching simple " % fSimpleCode) code
  url <- getUrl ("/uncl/uncl" % fSimpleCodeLower % ".htm") code
  outputFile <- getOutputFile (fSimpleCodeLower % ".txt") simplesDirectory code
  htmlToFile url TE.decodeUtf8 outputFile
