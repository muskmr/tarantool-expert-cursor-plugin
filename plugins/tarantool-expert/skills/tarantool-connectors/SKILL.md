---
name: tarantool-connectors
description: Integrate apps with Tarantool via official/community connectors (Go, Python, Java, C/C++, Node, etc.) — CRUD, call, and connection practices for client repos.
---

# Connectors

Canonical: `doc/connector/*`, getting started connectors.

## Responsibilities split

- **Server (Tarantool)** — schema, stored procedures, auth, replication
- **Client connector** — connection pool, requests (`select`/`insert`/`call`), timeout/retry policy

## Best practices

1. Prefer calling stable stored procedures for multi-step business logic (fewer round trips, server-side atomicity).
2. Match tuple field order/types to space format.
3. Handle errors explicitly; do not ignore connection closed / timeout.
4. Keep credentials outside source; use env/secret stores.
5. For vshard, use router-side APIs or app services that already encapsulate bucket routing — clients should not guess storage endpoints.

## When reviewing client code

Check packing of keys, nullable fields (`nil` vs absence), pagination limits, and idempotency of retries.
