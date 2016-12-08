{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}

module Text.Edifact.Inspect
  ( inspect
  ) where

import           Text.Edifact.Types

import           Control.Monad.Reader (Reader, ask, local, runReader)
import           Data.Maybe           (catMaybes)
import           Data.String          (IsString)
import           Data.Text            (Text)
import           Formatting

type Indent = Int

type Rendering = Reader Indent

indent :: Rendering a -> Rendering a
indent = local (+1)

getIndentation :: Rendering Int
getIndentation = ask

inspect :: Value -> Text
inspect = renderInspection . valueRenderer

renderInspection :: Rendering a -> a
renderInspection r = runReader r 0

valueRenderer :: Value -> Rendering Text
valueRenderer (Simple    _ primitive) = primitiveRenderer primitive
valueRenderer (Composite _ values)    = sformat inBrackets . commaSeparated . catMaybes <$> traverse positionRenderer values
valueRenderer (Segment code values)   = indentedPrefix fSegmentCode code " " . spaceSeparated . catMaybes =<< traverse positionRenderer values
valueRenderer (Group   code values)   = indentedPrefix fGroupCode code "\n" . lineSeparated =<< indent (traverse silentPositionRenderer values)
valueRenderer (Message code values)   = indentedPrefix fMessageCode code "\n" . lineSeparated =<< indent (traverse silentPositionRenderer values)

inBrackets :: Format r (Text -> r)
inBrackets = "[" % stext % "]"

indentedPrefix :: Format (String -> Text -> Text) (code -> String -> Text -> Text) -> code -> String -> Text -> Rendering Text
indentedPrefix codeFormatter code sep t = do
  i <- getIndentation
  let prefix = replicate (i * 2) ' '
  pure (sformat (string % codeFormatter % string % stext) prefix code sep t)

fMessageCode :: Format r (MessageCode -> r)
fMessageCode = mapf getMessageCode ("message " % string)

fGroupCode :: Format r (GroupCode -> r)
fGroupCode = mapf getGroupCode ("Segment Group - " % string)

fSegmentCode :: Format r (SegmentCode -> r)
fSegmentCode = mapf getSegmentCode string

positionRenderer :: (Position, Maybe Value) -> Rendering (Maybe Text)
positionRenderer (pos, value) = fmap (flip (sformat (stext % fPosition)) pos)  <$> traverse valueRenderer value

silentPositionRenderer :: (Position, [Value]) -> Rendering Text
silentPositionRenderer (_, value) = lineSeparated <$> traverse valueRenderer value

fPosition :: Format r (Position -> r)
fPosition = mapf getPosition ("@" % string)

primitiveRenderer :: Primitive -> Rendering Text
primitiveRenderer (String t) = pure (sformat ("\"" % stext % "\"") t)
primitiveRenderer (Number s) = pure (sformat shown s)

newtype CommaSeparated = CommaSeparated { getCommaSeparated :: Text } deriving newtype (IsString, Eq)

instance Semigroup CommaSeparated where
  t1 <> "" = t1
  "" <> t2 = t2
  t1 <> t2 = CommaSeparated (getCommaSeparated t1 <> "," <> getCommaSeparated t2)

instance Monoid CommaSeparated where
  mempty = ""

commaSeparated :: Foldable f => f Text -> Text
commaSeparated = getCommaSeparated . foldMap CommaSeparated

newtype SpaceSeparated = SpaceSeparated { getSpaceSeparated :: Text } deriving newtype (IsString, Eq)

instance Semigroup SpaceSeparated where
  t1 <> "" = t1
  "" <> t2 = t2
  t1 <> t2 = SpaceSeparated (getSpaceSeparated t1 <> " " <> getSpaceSeparated t2)

instance Monoid SpaceSeparated where
  mempty = ""

spaceSeparated :: Foldable f => f Text -> Text
spaceSeparated = getSpaceSeparated . foldMap SpaceSeparated

newtype LineSeparated = LineSeparated { getLineSeparated :: Text } deriving newtype (IsString, Eq)

instance Semigroup LineSeparated where
  t1 <> "" = t1
  "" <> t2 = t2
  t1 <> t2 = LineSeparated (getLineSeparated t1 <> "\n" <> getLineSeparated t2)

instance Monoid LineSeparated where
  mempty = ""

lineSeparated :: Foldable f => f Text -> Text
lineSeparated = getLineSeparated . foldMap LineSeparated
