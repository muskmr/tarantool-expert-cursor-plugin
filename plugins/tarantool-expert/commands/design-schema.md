---
name: design-schema
description: Design or refine Tarantool spaces, indexes, and formats for the current requirements
---

# Design Tarantool schema

Use `tarantool-data-model`, `tarantool-schema-design`, and `tarantool-engines`.

1. Collect entities, access patterns, and size/latency constraints from the user or repo.
2. Propose spaces, field formats, primary/secondary indexes, sequences.
3. Choose `memtx` vs `vinyl` per space with rationale.
4. If sharding is in scope, include bucket-id fields and routing key rules.
5. Emit a Mermaid `erDiagram` (spaces/fields) and example `box.schema` / declarative schema snippets matching the project style.
