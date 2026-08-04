---
name: tarantool-tt-cli
description: Use tt CLI for local Tarantool application development — create apps, manage instances, migrations, rocks, and developer workflows.
---

# tt CLI for developers

Canonical: `tooling/tt_cli/*`.

## Common developer flows

- Create / enable instances for an application
- Start/stop/status local instances
- Enter console / run scripts
- Manage rocks and app dependencies
- Run migrations
- Package or pack apps when the project uses tt packaging

## Guidance

1. Prefer `tt` commands already documented in the project's README.
2. Keep developer environment reproducible (`tt.yaml`, instance files, `.gitignore` for runtime artifacts).
3. Use tt for **local and staging-like** workflows; do not assume tt replaces enterprise cluster managers.

When scaffolding, use `/scaffold-tt-app`.
