---
name: tarantool-replication
description: Design and explain Tarantool replication — replica sets, async vs synchronous replication, leader election, bootstrap topologies — for application architecture and repo configs.
---

# Replication

Canonical: `platform/replication/*`.

## Concepts

- **Replica set** — instances sharing the same dataset via iproto replication
- **Master / replica** roles (read-write vs read-only)
- **Async replication** (default) — fast; acknowledge may precede full replica apply
- **Synchronous replication** — commit waits for quorum; stronger durability; RAFT-based election features in modern versions
- Failover modes: manual, automated election, supervised (version/feature dependent)

## Common topologies (use Mermaid templates)

1. Standalone (no replication)
2. Master + replicas (manual or auto failover)
3. Master-master (conflict-aware; usually special cases)

## Design checklist

- Bootstrap order and `replicaset.uuid` / instance uuids in config
- Listen/advertise addresses for iproto
- Read policy for app (always primary vs read replicas)
- Upgrade order planning (see `tarantool-upgrades`)

Out of scope: live lag tuning on high-load production clusters. Focus on correct architecture and repo config.
