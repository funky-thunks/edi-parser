# edi-parser-scaffolder

Autonomous utility to generate parser for a given revision of the Edifact
specification.

## Usage

1. fetch specification for a given Edifact revision
2. scaffold the parsers for this specification

### Read specification

Read files downloaded from
https://unece.org/trade/uncefact/unedifact/download

You can specify individual files one by one:
```
$ stack exec edi-parser-scaffolder -- read-bundle --revision D96A --specification ./specification/references/ --message-file /path/to/D96A/DIRDEF_D.96A  --segment-file /path/to/D96A/TRSD.96A --composite-file /path/to/D96A/TRCD.96A --simple-file /path/to/D96A/TRED.96A --simple-code-file /path/to/D96A/UNCL-1.96A  --simple-code-file /path/to/D96A/UNCL-2.96A
$ stack exec edi-parser-scaffolder -- read-bundle --revision D21B --specification ./specification/references/ --message-file /path/to/D21B/IFCSUM_D.21B --message-file /path/to/D21B/IFTSTA_D.21B  --segment-file /path/to/D21B/EDSD.21B --segment-file /path/to/D21B/IDSD.21B --composite-file /path/to/D21B/EDCD.21B --composite-file /path/to/D21B/IDCD.21B --simple-file /path/to/D21B/EDED.21B --simple-code-file /path/to/D21B/UNCL.21B
```

Or give the whole zip file:
```
$ stack exec edi-parser-scaffolder -- read-bundle --revision D96A --message IFCSUM --message IFTSTA --message IFTSAI --message DESADV --specification ./specification/references/ --bundle /path/to/D96A/d96a.zip
```

### Fetch specification

This function is deprecated and parsing may break at any time!
Prefer the bundle reading above

```
$ stack exec edi-parser-scaffolder -- \
  fetch --revision D96A --specification ./specification/references
```

If you're only interested in a subset of the specification, you can select the
messages:

```
$ stack exec edi-parser-scaffolder -- \
  fetch --revision D96A --specification ./specification/references/ --messages IFCSUM,IFTSAI,DESADV
```

### Scaffold the parsers

```
$ stack exec edi-parser-scaffolder -- \
  scaffold --revision D96A --specification ./specification/references/ --src specification/src/
```
