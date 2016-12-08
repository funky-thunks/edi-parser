# edi-parser-specification

Scaffolding for some of the revisions of the Edifact specifaction.

This is generated via [edi-parser-scaffolder] and depends on [edi-parser-core].

This is meant to be used as first-level dependency in a project parsing messages
from the revisions supported here.

## Supported revisions

- 96.A

## Companion tool

```
$ stack exec edi-parser-specification -- --help
ifcsum <file> : inspect IFCSUM file for revision D96A
-h|--help     : this message
```

[edi-parser-core]:       ../core/README.md
[edi-parser-scaffolder]: ../scaffolder/README.md
