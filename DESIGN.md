# Design rationale for SCIP

Sourcegraph supports viewing and navigation code.
This is similar to an IDE, except for the actual "editor" part.

The design of SCIP is based on this primary motivating use case,
as well as for fixing the pain points we encountered with using LSIF.[^1]

SCIP is meant to be _transmission_ format for sending
data from some producers to some consumers
-- it is not meant as a _storage_ format for querying.
Ideally, producers should be able to directly output SCIP
instead of going through an intermediate format
and then converting to SCIP for transmission.

[^1]: Sourcegraph historically supported LSIF uploads
as well as maintained our own LSIF indexers,
but we ran into issues of development velocity,
debugging, as well as indexer performance bottlenecks.

## Goals

### Primary goals

- Support code navigation at the fidelity of state-of-the-art IDEs.
  - Why: We want people to have an excellent experience navigating
    their code inside Sourcegraph itself.
- Ease of writing indexers (i.e. producers).
  - Adding cross-repo navigation support should be easy.
    - Why: Scaling for Sourcegraph customers using code spread across many repos,
      as well as supporting code navigation for package ecosystems.
  - Adding file-level incrementality should be easy.
    - Why: Scaling for large monorepos.
  - Making the indexer parallel should be easy
    - Why: Scaling for large monorepos.
- Robustness against indexer bugs: Incorrect code nav data for a certain entity
  should have a limited blast radius.
- Ease of debugging.

## Non-goals

- Support use cases involving code modifications.
  - Why: Sourcegraph's code search and navigation has historically
    focused on read-only use cases. Adding support for code modifications
    introduces more complexity.
- Ease of writing consumers.
  - Why: We expect the number of SCIP producers to be much higher
    than the number of consumers,
    so it makes sense to optimize for producers.
- Be as compact as possible in uncompressed form.
  - Why: Modern general-purpose compression formats like gzip
    and zstd are already very good in terms of both compression
    speed and compression ratio.
- Support efficient code navigation by itself.
  - Why: Code navigation fundamentally requires some form of bidirectional
    lookup which is best served by a query engine.

    For example, finding subclasses and superclasses are dual operations;
    supporting both across different indexes (for cross-repository navigation)
    requires some way of connecting the data together anyways.
    However, if the consumer is capable of supporting that,
    then recording bidirectional links in index data is not useful.

## Core design decisions

### Using Protobuf for the schema

- Relatively compact binary format, reducing I/O overhead.
- Protobuf supports easy code generation.
- Many languages have Protobuf code generators.
- TLV format enables streaming reads and writes
  as well as merging by concatenation.
- Rules for maintaining forward and backward compatibility
  are easily understood.

### Using strings for IDs

Hash tables are a core data type used in compilers and
hence are likely to be useful in indexers generally.

String types in mainstream languages support equality and hashing.
where other objects may not be.

### Avoid direct encoding of graphs

One very tempting design for code navigation data is to
think of all semantic entities as nodes and relationships between
entities as edges, and to simply record ALL data
using an adjacency list based graph representation.

This is conceptually appealing,
but is not desirable for a few reasons:

- It encourages a wholesale approach to writing
  indexers as it involves merging all the data together.
  Such indexers are less likely to be able
  to easily support parallelism.
- This potentially requires keeping a lot of data of memory
  at indexing time. Ideally, an indexer should be able
  to load parts of the codebase,
  append index data for that part to an open file,
  and then move on to the next part having cleared all memory
  being used from the previous iteration.
- It potentially requires keeping a lot of data in memory
  on the consumer side.

Instead, the approach to using documents and arrays
helps colocate relevant data and naturally allows for streaming
if the underlying data format allows streaming.

### Avoiding integer IDs

This includes avoiding structures like a symbol table
mapping string IDs to integers and mostly using the integer
IDs in raw data.

As far as we know, the integer IDs in LSIF are primarily present as
an ad-hoc compression scheme due to the verbosity of JSON
and LSIF's graph-based encoding scheme.

Avoiding integer IDs helps with limiting the blast radius
of indexer bugs. With LSIF, we've had off-by-one bugs in indexers
cause code navigation to fail repo-wide.

This also helps with debugging, as the raw data itself
can be inspected much more easily without needing
a lot of surrounding context.
