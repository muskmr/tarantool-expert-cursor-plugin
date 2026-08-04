---
name: tarantool-repo-analysis
description: Analyze Tarantool-powered repositories — detect layout (tt/3.x config, box.cfg, Cartridge, vshard, connectors), map schema/topology, and produce a developer-oriented assessment. Use when opening or auditing a Tarantool project in Cursor.
---

# Tarantool repository analysis

Source of truth: [tarantool/doc](https://github.com/tarantool/doc) / https://www.tarantool.io/en/doc/latest/

## Detect project shape

Scan for signals:

| Signal | Likely type |
| --- | --- |
| `tt.yaml` / `.tt.yaml`, `instances.enabled`, `instances.yaml` | tt-managed app |
| `*.yml` with `credentials`, `iproto`, `replication`, `roles` | Tarantool 3.x declarative config |
| `box.cfg{...}` in Lua entrypoint | Classic app |
| `cartridge`, `cartridge.cfg` | Cartridge framework |
| `vshard.storage` / `vshard.router` | Sharded cluster app |
| `tarantool` Go/Python/Java client only | Connector consumer |
| `*.rockspec`, `rocks/` | Lua rocks / modules |

## Inventory checklist

1. Entrypoints and roles (`init.lua`, role modules)
2. Schema definition sites (`box.schema.space.create`, migrations, declarative schema)
3. Engines used per space
4. Topology declared in config (replicasets, failover, vshard routers/storages)
5. Migrations folder and versioning
6. Tests (`tap`, `luatest`, CI)
7. Connectors and external API surface
8. Secrets handling (should not be committed)

## Output format

- Project type + Tarantool version hints
- Component map (paths)
- Data model summary
- Topology summary + recommended Mermaid template
- Risks / gaps for solution DLC (design → implement → test → migrate → upgrade)
- Suggested next commands: `/design-schema`, `/design-topology`, `/plan-migration`, `/review-tarantool`
