# edi-parser

This is general approach to Edifact messages parsing.

This format isn't self descriptive and one has to know the specification to
build the right structure from a payload.

The Edifact specification is quite rich and updated 2 or 3 times a year between
1990 and 2008. This project is providing combinators (see [edi-parser-core])
and a scaffolder (see [edi-parser-scaffolder]) to derive parsers from a given
revision.

Some of those specification will be derived for general use (see
[edi-parser-specification]).

It currently supports:
- D96A
- D01B

[edi-parser-core]:          core/README.md
[edi-parser-scaffolder]:    scaffolder/README.md
[edi-parser-specification]: specification/README.md
