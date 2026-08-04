---
name: design-topology
description: Design Tarantool instance topology (standalone, replica set, or vshard) with Mermaid diagrams
---

# Design Tarantool topology

Use `tarantool-replication`, `tarantool-vshard`, and `tarantool-mermaid-diagrams`.

1. Start from availability and scale requirements; pick the simplest fitting topology.
2. Produce a Mermaid diagram from the canonical templates (do not invent roles).
3. Document instance roles, failover mode (manual / election / supervised), and sync vs async replication choice.
4. For vshard: routers, storages, replica sets, bucket count guidance, rebalancer notes.
5. Outline local/`tt` bootstrap steps for developers (not production ops runbooks for high-load clusters).
