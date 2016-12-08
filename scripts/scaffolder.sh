#!/usr/bin/env bash

HERE="$(dirname "$0")"

REVISION="D96A"
if [ -n "$1" ]
then
  REVISION=$1
  shift 1
fi

function specification {
  stack exec edi-parser-scaffolder -- \
    scaffold --revision "$REVISION" \
      --src "$HERE/../src" \
      --specification "$HERE/../specification"
}

function missing {
  echo "$1 is missing. Aborting."
  exit 1
}

function checkRequirements {
  command -v stylish-haskell > /dev/null || missing "stylish-haskell"
}

checkRequirements
specification
