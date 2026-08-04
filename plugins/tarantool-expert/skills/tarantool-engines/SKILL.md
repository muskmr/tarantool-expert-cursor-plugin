---
name: tarantool-engines
description: Choose and configure Tarantool storage engines memtx (in-memory) vs vinyl (on-disk). Use when selecting engines or explaining performance/capacity trade-offs in project design.
---

# Storage engines

Canonical: `platform/engines/*`, especially memtx vs vinyl differences.

## memtx (default)

- In-memory, very low latency
- Index types: TREE, HASH, RTREE, BITSET
- Supports temporary spaces, richer alter/random features
- Dataset must fit RAM (+ overhead)

## vinyl

- On-disk LSM-style engine for datasets larger than RAM
- Index type: TREE
- Different semantics for some APIs (`len` approximate, `delete` returns nil, yields on reads)
- Prefer careful secondary-index count; optimize for write/compaction patterns

## Decision guide

| Situation | Prefer |
| --- | --- |
| Hot session/cache/token data | memtx |
| Large historical/event data | vinyl |
| Need HASH/RTREE/BITSET | memtx |
| Mixed | different engines per space |

Document the choice per space in architecture notes. This skill is for design/repo guidance, not live vinyl tuning of production clusters.
