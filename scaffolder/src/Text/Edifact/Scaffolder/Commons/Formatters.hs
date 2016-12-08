{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Commons.Formatters
  ( -- *
    fMessageCode
  , fMessageParserFunction
  , fGroupCode
  , fSegmentCode
  , fSegmentParserFunction
  , fCompositeCode
  , fCompositeParserFunction
  , fSimpleCode
  , fSimpleParserFunction

    -- *
  , fParserSignature
  , fParserDeclaration
    -- *
  , fModuleName
  , fPosition
  , fPresence
    -- *
  , quoted
  , simpleQuoted
  , parens
  , notYetImplemented
  ) where

import           Text.Edifact.Scaffolder.Commons.Types

import           Formatting                            as F

fMessageCode:: Format r (MessageCode -> r)
fMessageCode = mapf getMessageCode F.string

fMessageParserFunction :: Format r (MessageCode -> r)
fMessageParserFunction = mapf getMessageCode ("message" % F.string)

fGroupCode :: Format r (GroupCode -> r)
fGroupCode = mapf getGroupCode F.string

fSegmentCode :: Format r (SegmentCode -> r)
fSegmentCode = mapf getSegmentCode F.string

fSegmentParserFunction :: Format r (SegmentCode -> r)
fSegmentParserFunction = mapf getSegmentCode ("segment" % F.string)

fCompositeCode :: Format r (CompositeCode -> r)
fCompositeCode = mapf getCompositeCode F.string

fCompositeParserFunction :: Format r (CompositeCode -> r)
fCompositeParserFunction = mapf getCompositeCode ("composite" % F.string)

fSimpleCode :: Format r (SimpleCode -> r)
fSimpleCode = mapf getSimpleCode F.string

fSimpleParserFunction :: Format r (SimpleCode -> r)
fSimpleParserFunction = mapf getSimpleCode ("simple" % F.string)

fParserSignature :: Format r a -> Format r a
fParserSignature f = f % " :: Parser Value"

fParserDeclaration :: Format r a -> Format r a
fParserDeclaration f = f % " ="

fModuleName :: Format r (ModuleName -> r)
fModuleName = mapf getModuleName string

fPosition :: Format r (Position -> r)
fPosition = mapf getPosition F.string

fPresence :: Format r (Presence -> r)
fPresence =
  let f Mandatory = "mandatory"
      f Optional  = "optional "
  in mapf f F.string

quoted :: Format r a -> Format r a
quoted f = "\"" % f % "\""

simpleQuoted :: Format r a -> Format r a
simpleQuoted f = "'" % f % "'"

parens :: Format r a -> Format r a
parens f = "(" % f % ")"

notYetImplemented :: Format r a -> Format r a
notYetImplemented desc = "notYetImplemented " % quoted (desc % " not yet implemented")
