# Tarantool Expert — Cursor plugin

Cursor Marketplace plugin (**Tarantool IS Expert**) that turns Agent into a Tarantool solution companion for work in source repositories and local/dev environments.

It packages rules, skills, agents, commands, and **canonical Mermaid diagram templates** distilled from [tarantool/doc](https://github.com/tarantool/doc) / [Tarantool documentation](https://www.tarantool.io/en/doc/latest/).

> Knowledge-oriented: analyze, design, implement, review, migrate, and document Tarantool-powered apps.  
> Not a live ops console for high-load production clusters (no Tarantool MCP connection in v0.1).

## Plugin

| Name | Path | Description |
| --- | --- | --- |
| `tarantool-expert` | [`plugins/tarantool-expert`](plugins/tarantool-expert) | Universal Tarantool DLC toolkit for Cursor |

Author: **muskmr** (`muskmr@gmail.com`) · License: **MIT** · See [NOTICE](NOTICE) for trademark/docs attribution · [SECURITY.md](SECURITY.md)

Before marketplace publish, follow [docs/marketplace-checklist.md](docs/marketplace-checklist.md).

## Try it locally in Cursor

This is a Cursor plugin (skills/rules/commands), not a VS Code extension — there is no F5 host.

```bash
./scripts/install-local.sh   # copies plugin → ~/.cursor/plugins/local/tarantool-expert
```

Then in Cursor: **Developer: Reload Window** → open **Customize** → try `/analyze-tarantool-repo` or `/diagram-tarantool` in Agent chat.

Full smoke-test plan: [docs/local-testing.md](docs/local-testing.md).

## What's included

### Skills (16)

Repo analysis, data model, schema design, engines (memtx/vinyl), Lua apps, config, replication, vshard, migrations, upgrades, tt CLI, connectors, testing, security, code review, Mermaid templates.

### Rules

- Tarantool core terminology & project conventions
- Lua / `box.NULL` style (official guide aligned)
- Mermaid canonical diagramming constraints

### Agents

- `tarantool-architect` — solution design
- `tarantool-reviewer` — change review
- `tarantool-migrator` — migrations & version upgrades

### Commands

`analyze-tarantool-repo`, `design-schema`, `design-topology`, `review-tarantool`, `diagram-tarantool`, `plan-migration`, `scaffold-tt-app`

### Mermaid templates

Standalone, master-replica, sync replication, master-master, vshard cluster, bucket states, request flow, persistence, schema ER, engine choice, fiber model, migration sequence — under `skills/tarantool-mermaid-diagrams/templates/`.

## Install / publish

This repo follows the [Cursor plugin template](https://github.com/cursor/plugin-template) multi-plugin layout:

- Root marketplace manifest: [`.cursor-plugin/marketplace.json`](.cursor-plugin/marketplace.json)
- Plugin manifest: [`plugins/tarantool-expert/.cursor-plugin/plugin.json`](plugins/tarantool-expert/.cursor-plugin/plugin.json)

Validate locally:

```bash
node scripts/validate-template.mjs
```

Submit the public GitHub repository at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish).

## Development lifecycle coverage

| DLC stage | Use |
| --- | --- |
| Discover / analyze | `/analyze-tarantool-repo`, `tarantool-repo-analysis` |
| Design | `/design-schema`, `/design-topology`, architect agent, Mermaid skill |
| Implement | Lua apps, config, tt CLI, connectors skills |
| Test | `tarantool-testing` |
| Review | `/review-tarantool`, reviewer agent |
| Migrate / upgrade | `/plan-migration`, migrator agent |
| Document | `/diagram-tarantool` + templates |

## Attribution

Concepts and terminology are derived from the official Tarantool documentation repository ([tarantool/doc](https://github.com/tarantool/doc)). This plugin is an independent community project and is not affiliated with Tarantool LLC.
