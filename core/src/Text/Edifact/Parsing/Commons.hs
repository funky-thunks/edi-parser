module Text.Edifact.Parsing.Commons
  ( -- * Parsing context
    Parser
  , Context(..)
  , CurrentPosition(..)
  , defaultContext

    -- * State combinators
  , updateSyntax
  , setCurrentPosition
  , resetCurrentPosition

    -- * Syntax helpers
    -- ** Parsing combinators
  , parseCompositeSeparator
  , parseElementSeparator
  , parseSegmentSeparator
  , parseEscape

    -- ** State accessors
    -- | Shortcuts to the syntax in current state. Doesn't alter input stream.
  , getCompositeSeparator
  , getElementSeparator
  , getSegmentSeparator
  , getDecimalSign

   -- * Context aware failure helpers
  , failWithPosition
  , (<??>)

    -- * Parsec extras
  , tries

    -- * Technical combinators
  , notYetImplemented
  ) where

import           Text.Edifact.Types (Position, Syntax (..), defaultSyntax)

import           Data.Text          (Text)
import           Text.Parsec        (Parsec, char, choice, endOfLine, getState,
                                     modifyState, try, updateState, (<?>))

-- | Defines our "Text.Parsec" context.
type Parser = Parsec Text Context

data Context =
  Context
    { parsingSyntax   :: Syntax          -- ^ State of the syntax. To be updated on the encounter of the @UNA@ segment.
    , currentPosition :: CurrentPosition -- ^ Pointer for current position in the parser. Used for enriched parsing error messages.
    }

defaultContext :: Context
defaultContext = Context defaultSyntax Undefined

-- | Current position in the parser.
--
-- For now it only stores the current position in a message, a segment group,
-- a segment, or a composite.
--
-- Future version could store the whole path to improve debugging.
data CurrentPosition = Undefined
                     | Defined Position
                       deriving Show

getSyntax :: Parser Syntax
getSyntax = parsingSyntax <$> getState

-- | Get current charactor for decimal sign.
-- It doesn't parse nor consume input.
getDecimalSign :: Parser Char
getDecimalSign = decimalSign <$> getSyntax

-- | Get current charactor for segment separator.
-- It doesn't parse nor consume input.
getSegmentSeparator :: Parser Char
getSegmentSeparator = segmentSeparator <$> getSyntax

-- | Get current charactor for element separator.
-- It doesn't parse nor consume input.
getElementSeparator :: Parser Char
getElementSeparator = elementSeparator <$> getSyntax

-- | Get current charactor for composite separator.
-- It doesn't parse nor consume input.
getCompositeSeparator :: Parser Char
getCompositeSeparator = compositeSeparator <$> getSyntax

-- | This let change the operators used in the parsing. This is designed for the @UNA@ segment.
updateSyntax :: Syntax -> Parser ()
updateSyntax s = updateState (\ c -> c { parsingSyntax = s })

-- | Read the parser state to extract current position.
-- It doesn't parse nor consume input.
getCurrentPosition :: Parser CurrentPosition
getCurrentPosition = currentPosition <$> getState

-- | Write the parser state to update current position.
-- It doesn't parse nor consume input.
setCurrentPosition :: Position -> Parser ()
setCurrentPosition = updateCurrentPosition . Defined

-- | Write the parser state to reset current position.
-- It doesn't parse nor consume input.
resetCurrentPosition :: Parser ()
resetCurrentPosition = updateCurrentPosition Undefined

updateCurrentPosition :: CurrentPosition -> Parser ()
updateCurrentPosition pos = modifyState (\s -> s { currentPosition = pos })

-- | Parse current charactor for element separator.
-- It does parse and consume input.
parseElementSeparator :: Parser Char
parseElementSeparator = parseSpecialChar "element separator" elementSeparator

-- | Parse current charactor for composite separator.
-- It does parse and consume input.
parseCompositeSeparator :: Parser Char
parseCompositeSeparator = parseSpecialChar "composite separator" compositeSeparator

-- | Parse current charactor for escape separator.
-- It does parse and consume input.
parseEscape :: Parser Char
parseEscape = parseSpecialChar "escape character" escape

-- | Parse current charactor for segment separator.
-- It does parse and consume input.
--
-- It also tries consuming end of line after segment separator if any.
parseSegmentSeparator :: Parser Char
parseSegmentSeparator = tries [ parseSpecialChar "segment separator" segmentSeparator <* endOfLine
                              , parseSpecialChar "segment separator" segmentSeparator
                              ]

parseSpecialChar :: String -> (Syntax -> Char) -> Parser Char
parseSpecialChar description reader = do
  c <- reader <$> getSyntax
  let escape' '\"' = "\\\""
      escape' c'   = [c']
      comment = description <> " (\"" <> escape' c <> "\")"
  char c <?> comment

-- | Let you try various parsers, not consuming until success.
tries :: [Parser a] -> Parser a
tries = choice . map try

-- | Like 'fail', this operator let you annotate a parser if it were to fail.
-- The difference with the standard "Text.Parsec" operator is that it appends
-- the current position if any.
failWithPosition :: String -> Parser a
failWithPosition = withPosition fail

-- | Like '<?>', this operator let you annotate a parser if it were to fail.
-- The difference with the standard "Text.Parsec" operator is that it appends
-- the current position if any.
(<??>) :: Parser a -> String -> Parser a
(<??>) = withPosition . (<?>)

-- Same priority as <?> from Text.Parsec
infix 0 <??>

withPosition :: (String -> Parser a) -> String -> Parser a
withPosition continuation msg =
  let mkMessage Undefined   = msg
      mkMessage (Defined d) = msg <> " at position " <> show d
      getMessage = mkMessage <$> getCurrentPosition
  in getMessage >>= continuation

-- | Alias to 'failWithPosition' to convey semantics of work-in-progress when
-- writing a parser. This might be useful if you want to partially support a
-- message.
notYetImplemented :: String -> Parser a
notYetImplemented = failWithPosition
