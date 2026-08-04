# Tarantool IS Expert

Community Cursor plugin for Tarantool-powered solutions — for solution developers, app developers, and DLC work in repositories and local/dev setups.

> Independent community project. Not affiliated with Tarantool LLC / VK. See [NOTICE](NOTICE).

## Features

- **Skills** for schema, engines, Lua apps, replication, vshard, migrations, upgrades, tt, connectors, testing, security, review, and repo analysis
- **Canonical Mermaid templates** so architecture diagrams match Tarantool vocabulary
- **Agents** for architecture, review, and migration planning
- **Slash commands** for common DLC tasks

## Scope

**In scope:** reading/writing project code and configs, designing topologies, planning migrations, documenting with Mermaid.

**Out of scope:** live MCP connection to Tarantool; production/high-load cluster operations; automatic hooks.

## Security posture

- Knowledge-only pack (markdown skills/rules/commands/agents)
- No plugin runtime dependencies, no hooks, no MCP servers
- Guidance tells Agent to keep secrets out of git and avoid unsafe install patterns
- Report issues via [SECURITY.md](../../SECURITY.md)

## Quick commands

- `/analyze-tarantool-repo`
- `/design-schema`
- `/design-topology`
- `/diagram-tarantool`
- `/plan-migration`
- `/review-tarantool`
- `/scaffold-tt-app`

## Sources

Grounded in [tarantool/doc](https://github.com/tarantool/doc) and https://www.tarantool.io/en/doc/latest/.
