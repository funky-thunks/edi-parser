{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

{-|
  Data types to represent Edifact values.

  See "Text.Edifact.Parsing" to learn how to build parsers and use such parsers.
 -}
module Text.Edifact.Types
  ( -- * Values
    Value(..)
  , Primitive(..)
  , Position(..)
    -- ** Element codes
  , MessageCode(..)
  , GroupCode(..)
  , SegmentCode(..)
  , CompositeCode(..)
  , SimpleCode(..)
    -- * Syntax
  , Syntax(..)
  , defaultSyntax
  ) where

import           Data.Scientific (Scientific)
import           Data.String     (IsString (..))
import           Data.Text       (Text)

-- | Code for a message.
--
-- Content is expected to match this regexp: @[A-Z]{6}@.
newtype MessageCode = MessageCode { getMessageCode :: String } deriving newtype (Eq, Show, IsString)

-- | Code for a segment group.
--
-- It's a code local to the message definition.
newtype GroupCode = GroupCode { getGroupCode :: String } deriving newtype (Eq, Show, IsString)

-- | Code for a segment.
--
-- Content is expected to match this regexp: @[A-Z]{3}@.
--
-- Standard segment codes are expected to match this regexp: @UN[A-Z]@.
newtype SegmentCode = SegmentCode { getSegmentCode :: String } deriving newtype (Eq, Show, IsString)

-- | Code for a composite element.
--
-- Content is expected to match this regexp: @C[0-9]{3}@.
--
-- It can also be used for standalone composites, frequently in standard segment
-- definitions. In this case the codes are expected to match this regexp: @S[0-9]{3}@.
newtype CompositeCode = CompositeCode String deriving newtype (Eq, Show, IsString)

-- | Code for a simple element.
--
-- Content is expected to match this regexp: @[0-9]{4}@.
newtype SimpleCode = SimpleCode String deriving newtype (Eq, Show, IsString)

-- | Annotation of the position of the value relative to the parent value.
--
-- Content is expected to match this regexp: @[0-9]{3,4}@.
--
-- Example values:
--
-- > "010" :: Position
-- > "0210" :: Position
--
-- See 'Text.Edifact.Parsing.position' for how to parse one.
newtype Position = Position { getPosition :: String } deriving newtype (Eq, Show, IsString)

-- | Representation of a simple component.
--
-- When defined by the 'Text.Edifact.Parsing.numeric' combinator, the simple
-- component will produce a 'Number'.
--
-- When parsed by the 'Text.Edifact.Parsing.alphaNumeric' or
-- 'Text.Edifact.Parsing.alpha' combinators, the simple component will produce a
-- 'Text.Edifact.Types.String' from the raw textual representation.
data Primitive = String Text       -- ^ Default representation of a simple component.
               | Number Scientific -- ^ Representation of a numerical simple component.
                 deriving stock (Eq, Show)

-- | String like primitive values can be constructed via overloaded strings.
-- This is convenient, but might be removed.
instance IsString Primitive where
  fromString = String . fromString

-- | Recursive data structure to represent parsed Edifact values.
data Value = Message   MessageCode   [(Position, [Value])]
           | Group     GroupCode     [(Position, [Value])]
           | Segment   SegmentCode   [(Position, Maybe Value)]
           | Composite CompositeCode [(Position, Maybe Value)]
           | Simple    SimpleCode    Primitive
             deriving stock (Show, Eq)

-- | Defines the special charactors the parser should respect.
--
-- This is defined in every payload via the @UNA@ segment (first segment expected).
data Syntax = Syntax { compositeSeparator :: Char
                     , elementSeparator   :: Char
                     , decimalSign        :: Char
                     , escape             :: Char
                     , segmentSeparator   :: Char
                     }

-- | Default value to initialize the parser.
--
-- > Syntax { compositeSeparator = ':'
-- >        , elementSeparator   = '+'
-- >        , decimalSign        = '.'
-- >        , escape             = '?'
-- >        , segmentSeparator   = '\''
-- >        }
--
-- Those default charactors should be considered as recommended values rather
-- than official default values.
defaultSyntax :: Syntax
defaultSyntax =
  Syntax { compositeSeparator = ':'
         , elementSeparator   = '+'
         , decimalSign        = '.'
         , escape             = '?'
         , segmentSeparator   = '\''
         }
