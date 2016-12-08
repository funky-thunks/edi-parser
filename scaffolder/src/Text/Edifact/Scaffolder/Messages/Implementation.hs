{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Messages.Implementation
  ( -- *
    toImplementation
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Messages.Types

import           Control.Monad.State.Strict             (State, evalState, gets,
                                                         modify)
import           Data.List.NonEmpty                     as NE (NonEmpty (..),
                                                               fromList, head,
                                                               toList, (<|))
import           Formatting

toImplementation :: MessageCode -> NonEmpty Dependency -> [Text]
toImplementation _ =
  let closeList deps = deps <> [ "]" ]
  in closeList . render . fmap concat . traverse callDependency . NE.toList

render :: Rendering a -> a
render r =
  let initialState = RenderingContext 0 0 :| []
  in evalState r initialState

type Trail = NonEmpty

data RenderingContext = RenderingContext { listPosition :: Int
                                         , indentLevel  :: Int
                                         }

type Rendering = State (Trail RenderingContext)

callDependency :: Dependency -> Rendering [Text]
callDependency (Dependency element) = renderElement element

increment :: Rendering ()
increment =
  let mapHead f (v :| t)  = f v :| t
  in modify (mapHead (\ ctx -> ctx { listPosition = listPosition ctx + 1 }))

pushIndent :: Rendering ()
pushIndent =
  let indentState t@(previous :| _) = RenderingContext 0 (indentLevel previous + 2) <| t
  in modify indentState

popIndent :: Rendering ()
popIndent =
  let pop (_ :| []) = error "Incoherent state: can't unindent anymore (this shouldn't happen)"
      pop (_ :| up) = NE.fromList up
  in modify pop

getCurrentIndex :: Rendering Int
getCurrentIndex = gets (listPosition . NE.head)

getCurrentIndentation :: Rendering Int
getCurrentIndentation = gets (indentLevel . NE.head)

renderElement :: Element -> Rendering [Text]
renderElement (Segment code positional) =
  let output index indentation =
        [ sformat (fIndentation % fIndex % " " % fPositional % " " % fSegmentParserFunction) indentation index positional code
        ]
  in output <$> getCurrentIndex
            <*> getCurrentIndentation
            <*  increment
renderElement (GroupStart code positional) =
  let output index indentation =
        [ sformat (fIndentation % fIndex % " " % fPositional % " (") indentation index positional
        , sformat (fIndentation % fSegmentGroupFunction) (indentation + 1) code
        ]
  in output <$> getCurrentIndex
            <*> getCurrentIndentation
            <*  increment
            <*  pushIndent
renderElement (GroupEnd _) =
  let output indentation =
        [ sformat (fIndentation % "]") indentation
        , sformat (fIndentation % ")") (indentation - 1)
        ]
  in output <$> getCurrentIndentation
            <*  popIndent

fIndentation :: Format r (Int -> r)
fIndentation =
  let buildIndentation n = fromString (replicate (n * 2) ' ')
  in later buildIndentation

fIndex :: Format r (Int -> r)
fIndex =
  let buildIndex 0 = "["
      buildIndex _ = ","
  in later buildIndex

fPositional :: Format r (Positional -> r)
fPositional =
  let buildPositional (Positional p r) = bprint (quoted fPosition % " .@ " % fRepetition) p r
  in later buildPositional

fSegmentGroupFunction :: Format r (GroupCode -> r)
fSegmentGroupFunction = "segmentGroup " % quoted fGroupCode

fRepetition :: Format r (Repetition -> r)
fRepetition =
  let buildRepetition (Repetition Mandatory 1) = bprint  "once"
      buildRepetition (Repetition Optional  1) = bprint  "maybeOnce"
      buildRepetition (Repetition Mandatory c) = bprint ("repeatedAtLeastOnce" % " " % fCardinality) c
      buildRepetition (Repetition Optional  c) = bprint ("repeated" % " " % fCardinality) c
  in later buildRepetition

fCardinality :: Format r (Cardinality -> r)
fCardinality = mapf getCardinality int
