{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.BundleReader.Extractor
  ( FileContents(..)
  , readZip
  ) where

import           Text.Edifact.Scaffolder.Commons (Revision (..))

import           Codec.Archive.Zip
import           Data.ByteString                 as B (ByteString, isInfixOf,
                                                       isPrefixOf, readFile)
import           Data.ByteString.Lazy            as BS (fromStrict, toStrict)
import           Data.Char                       (toLower)
import           Data.List                       as L (intercalate, isPrefixOf)
import           Data.List.Split                 (splitOn)
import           Data.Maybe                      (maybeToList)

data FileContent =
  FileContent
    { fileType :: FileType
    , fileContent :: ByteString
    }

data FileType = Message | Segment | Composite | Simple | CodedSimple deriving Eq

data FileContents =
  FileContents
    { messages     :: [ByteString]
    , segments     :: [ByteString]
    , composites   :: [ByteString]
    , simples      :: [ByteString]
    , codedSimples :: [ByteString]
    }

readZip :: Revision -> FilePath -> IO FileContents
readZip specification f = toFileContents . parseFile (getExtension f) (getName f) specification <$> B.readFile f

toFileContents :: [FileContent] -> FileContents
toFileContents t = FileContents
  { messages     = fileContent <$> filter ((==) Message . fileType) t
  , segments     = fileContent <$> filter ((==) Segment . fileType) t
  , composites   = fileContent <$> filter ((==) Composite . fileType) t
  , simples      = fileContent <$> filter ((==) Simple . fileType) t
  , codedSimples = fileContent <$> filter ((==) CodedSimple . fileType) t
  }

getName :: FilePath -> String
getName = intercalate "." . init . splitOn "." . last . splitOn "/"

getExtension :: FilePath -> String
getExtension = fmap toLower . last . splitOn "."

parseFile :: String -> String -> Revision -> ByteString -> [FileContent]
parseFile "zip" _ specification content = unzipAndRead specification content
parseFile extension name specification content
  | ("d" <> extension) == (toLower <$> getRevision specification) = maybeToList $ identifyFile name content
parseFile _ _ _ _ = []

unzipAndRead :: Revision -> ByteString -> [FileContent]
unzipAndRead specification content = let
    archive = zEntries $ toArchive $ BS.fromStrict content
    toContents e@Entry{eRelativePath} = parseFile (getExtension eRelativePath) (getName eRelativePath) specification (BS.toStrict $ fromEntry e)
  in
    concatMap toContents archive

identifyFile :: String -> ByteString -> Maybe FileContent
identifyFile name content
  | "                                  Message Type : " `isInfixOf` content = pure $ FileContent Message content
  | "2.   Composite specifications" `B.isPrefixOf` content = pure $ FileContent Composite content
  | "2.   Segment specifications" `B.isPrefixOf` content = pure $ FileContent Segment content
  | "2.   Data element specifications" `B.isPrefixOf` content = pure $ FileContent Simple content
  | "UNCL" `L.isPrefixOf` name = pure $ FileContent CodedSimple content
identifyFile _ _ = Nothing
