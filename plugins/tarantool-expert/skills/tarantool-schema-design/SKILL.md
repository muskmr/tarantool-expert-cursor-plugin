---
name: tarantool-schema-design
description: Design Tarantool schemas from access patterns — normalize vs denormalize, keys, secondary indexes, sharding bucket fields, and evolution strategy.
---

# Tarantool schema design

## Workflow

1. List entities and the top queries (by key, range, uniqueness).
2. Choose primary key (stable, unique, compact). Prefer unsigned/uuid/string explicitly.
3. Add secondary indexes only for real query paths.
4. Decide denormalization for hot read paths (in-memory friendly) vs normalized spaces + lookups.
5. If vshard: add numeric **bucket_id** field to every sharded space; keep shard key → bucket function stable.
6. Plan migrations (`tt` / `space.upgrade`) before shipping breaking format changes.

## Access-pattern cheatsheet

| Need | Index / model tip |
| --- | --- |
| Point lookup by id | TREE/HASH primary |
| Unique natural key | unique secondary TREE |
| Range / ordered scan | TREE (not HASH) |
| Geo | RTREE (memtx) |
| Bitmask flags | BITSET (memtx) |
| Large cold dataset | vinyl + fewer secondary indexes |

## Anti-patterns

- Mutable primary keys
- Unbounded `select` without limits in app code
- Ignoring `box.NULL` in optional fields
- Sharded spaces without bucket field / wrong bucket in writes
- Mixing transactional assumptions across multiple buckets without app-level saga

Deliver schema + Mermaid `erDiagram` + migration notes.
