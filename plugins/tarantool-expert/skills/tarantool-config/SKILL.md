---
name: tarantool-config
description: Work with Tarantool configuration — 3.x declarative YAML, box.cfg, etcd-centralized config, credentials and iproto listeners — in application repos.
---

# Tarantool configuration

Canonical: `platform/configuration/*`, `reference/configuration/*`.

## Prefer project-native style

- If repo has declarative YAML (`config.yaml` / instance files with `roles`, `iproto`, `replication`) — extend that.
- If repo is classic `box.cfg{ listen = ..., ... }` — keep consistency unless migrating intentionally.
- `tt` applications often use `tt.yaml` + instance-enabled layout.

## Typical 3.x concerns

- `credentials.users` / privileges
- `iproto.listen` advertise endpoints
- `replication.failover` (`manual`, `election`, `supervised` where applicable)
- `roles` / `roles_cfg` for app modules
- `memtx` / `vinyl` / `wal` memory and durability parameters

## Safety for repos

- Do not commit real passwords; use env/templates/examples
- Keep sample configs under `doc/` or `instances.available/`
- When migrating config styles, provide a side-by-side mapping, do not silently rewrite production manifests

For topology semantics see `tarantool-replication` and `tarantool-vshard`.
