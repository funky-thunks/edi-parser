{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}

module Text.Edifact.Scaffolder.Commons.Text
  ( -- *
    indent
  , quote
  , haskellList
  , commaSeparated
    -- *
  , newline
    -- *
  , formatSpecification
    -- *
  , extensions
  ) where


import           Text.Edifact.Scaffolder.Commons.Types (LanguageExtension (..))

import           Control.Category                      ((>>>))
import           Data.Char                             (isSpace)
import           Data.List                             (dropWhileEnd)
import           Data.String                           (IsString)
import           Data.Text                             (Text)
import qualified Data.Text                             as T (all, dropWhileEnd,
                                                             null)
import           Formatting                            as F (mapf, sformat,
                                                             stext, string, (%))

formatSpecification :: [Text] -> [Text]
formatSpecification = cleanEmptyLines
                  >>> fmap quoteLine
                  >>> prependQuote

prependQuote :: [Text] -> [Text]
prependQuote ls =
  [ "-- | Derived from this specification:"
  , "--"
  ] <> ls

cleanEmptyLines :: [Text] -> [Text]
cleanEmptyLines = dropWhile blank >>> dropWhileEnd blank

blank :: Text -> Bool
blank t = T.null t || T.all isSpace t

quoteLine :: Text -> Text
quoteLine = haskellQuote >>> cleanWhitespaces

haskellQuote :: Text -> Text
haskellQuote line = "-- > " <> line

cleanWhitespaces :: Text -> Text
cleanWhitespaces = T.dropWhileEnd (== ' ')

indent :: Text -> Text
indent t = "  " <> t

quote :: Text -> Text
quote t = "'" <> t <> "'"

haskellList :: [Text] -> [Text]
haskellList =
  let prefix :: Int -> Text -> Text
      prefix 1 dep = sformat ("[ " % F.stext) dep
      prefix _ dep = sformat (", " % F.stext) dep
      suffix deps = deps <> ["]"]
  in suffix . zipWith prefix [1..]

newtype CommaSeparated = CommaSeparated { getCommaSeparated :: Text } deriving newtype (IsString, Eq)

instance Semigroup CommaSeparated where
  t1 <> "" = t1
  "" <> t2 = t2
  t1 <> t2 = CommaSeparated (getCommaSeparated t1 <> ", " <> getCommaSeparated t2)

instance Monoid CommaSeparated where
  mempty = ""

commaSeparated :: Foldable f => f Text -> Text
commaSeparated = getCommaSeparated . foldMap CommaSeparated

newline :: [Text]
newline = [""]

extensions :: [LanguageExtension] -> [Text]
extensions =
  let fExtension = "{-# LANGUAGE " % mapf getLanguageExtension F.string % " #-}"
  in fmap (sformat fExtension)
