---
name: tarantool-mermaid-diagrams
description: Produce canonical Mermaid diagrams for Tarantool topologies, vshard, persistence, schema, fibers, and migrations. Use whenever drawing Tarantool architecture to avoid non-canonical roles or mismatched terms.
---

# Tarantool Mermaid diagramming

Grounded in tarantool/doc concepts (spaces/tuples, memtx/vinyl, replica sets, vshard routers/storages/buckets, WAL/snapshots, fibers).

## How to use

1. Pick a template under `skills/tarantool-mermaid-diagrams/templates/`.
2. Replace placeholder names (`instance_a`, `users_space`, …) with project names.
3. Keep **node IDs** alphanumeric/underscore (no spaces). Quote labels that need punctuation.
4. Do not add `style` / `classDef` / `click`.
5. Prefer one concern per diagram.

## Template index

| File | Use for |
| --- | --- |
| `standalone.md` | Single instance app |
| `master-replica.md` | Async replica set |
| `sync-replication.md` | Sync replication / quorum idea |
| `master-master.md` | Dual-write topology (rare) |
| `vshard-cluster.md` | Routers + storage replica sets + buckets |
| `bucket-states.md` | Bucket migration state machine |
| `request-flow.md` | Client → iproto → instance/procedure |
| `persistence.md` | WAL + snapshots |
| `schema-er.md` | Spaces/fields relationships |
| `engine-choice.md` | memtx vs vinyl decision view |
| `fiber-model.md` | Cooperative multitasking |
| `migration-sequence.md` | Schema migration / upgrade sequence |

## Canonical vocabulary (do not rename)

`Instance`, `Master`, `Replica`, `ReplicaSet`, `Router`, `Storage`, `Bucket`, `Space`, `Index`, `WAL`, `Snapshot`, `Client`, `iproto`, `Rebalancer`.

## Quick starter

If unsure, start with `standalone.md` or `master-replica.md`, then escalate to `vshard-cluster.md` only when sharding is required.
