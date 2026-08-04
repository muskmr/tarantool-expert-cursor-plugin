---
name: tarantool-data-model
description: Canonical Tarantool data model — spaces, tuples, indexes, formats, CRUD operations, sequences, constraints. Use when explaining or implementing schema and data access.
---

# Tarantool data model

Canonical refs: `platform/concepts`, `platform/ddl_dml/*` in tarantool/doc.

## Core objects

- **Space** — named container of tuples (approx. table). Needs an engine and a **primary index**.
- **Tuple** — ordered array of fields (MsgPack). Format can describe field names/types but is optional.
- **Index** — TREE (default; memtx+vinyl), HASH/RTREE/BITSET (memtx). First index = unique primary key.
- **Sequence** — optional generators for ids.
- **Operations** — SELECT, INSERT, UPDATE, UPSERT, REPLACE, DELETE (plus Lua helpers `get`, `select`, `pairs`, etc.).

## Practical rules

1. Always define a primary unique index before using a space.
2. Prefer explicit `space:format({...})` in application schemas for readability and migrations.
3. Secondary indexes must match access patterns; avoid over-indexing on vinyl.
4. Field numbering is 1-based in Lua APIs.
5. Use `box.NULL` for SQL-NULL-like values; never confuse with Lua `nil` in tuples (nil truncates trailing fields).

## Example sketch

```lua
box.schema.space.create("users", { if_not_exists = true, engine = "memtx" })
box.space.users:format({
    { name = "id", type = "unsigned" },
    { name = "email", type = "string" },
    { name = "name", type = "string" },
})
box.space.users:create_index("primary", {
    parts = { { field = "id", type = "unsigned" } },
    if_not_exists = true,
})
box.space.users:create_index("email", {
    unique = true,
    parts = { { field = "email", type = "string", collation = "unicode_ci" } },
    if_not_exists = true,
})
```

## When designing

Prefer `tarantool-schema-design` for greenfield modeling and `tarantool-engines` for memtx/vinyl choice.
