---
name: analyze-tarantool-repo
description: Analyze the current repository as a Tarantool project — layout, schema, topology, risks
---

# Analyze Tarantool repository

Use the `tarantool-repo-analysis` skill.

1. Detect project type: declarative 3.x config, `box.cfg` app, Cartridge, vshard, connector-only client, rocks/modules.
2. Map key paths: entrypoints, roles, spaces/schema, migrations, tests, Docker/`tt` env.
3. Summarize data model, engines, topology (as declared in repo).
4. List gaps vs Tarantool best practices for solution development.
5. Suggest a prioritized improvement backlog (schema, tests, migrations, docs/diagrams).
