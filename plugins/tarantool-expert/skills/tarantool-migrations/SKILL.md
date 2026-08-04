---
name: tarantool-migrations
description: Plan and author Tarantool schema/data migrations with tt migrations and space.upgrade — for evolving application schemas safely.
---

# Migrations

Canonical: `platform/ddl_dml/migrations/*`.

## Tooling

- **tt migrations** — versioned migration files; centralized helpers for clusters
- **space.upgrade()** — background tuple transforms for format/data changes
- Schema can evolve independently from data in Tarantool; still treat production data changes carefully

## Recommended process

1. Capture current schema from code/migrations (not guessed).
2. Write additive steps first (new fields/indexes) before destructive ones.
3. Backfill data; dual-read if needed; then remove old fields.
4. Include verification (`select` checks, tap tests).
5. Document rollback (down migration or restore-from-snapshot strategy for destructive ops).

## Repo conventions

- Keep migrations ordered and immutable once applied
- Never edit applied migration files; add a new one
- Align with project's `tt` layout

Use `/plan-migration` command for end-to-end planning.
