---
name: scaffold-tt-app
description: Propose a tt-based Tarantool application skeleton (layout, config, roles, tests) for a new solution
---

# Scaffold tt application

Use `tarantool-tt-cli`, `tarantool-config`, `tarantool-lua-apps`, and `tarantool-testing`.

1. Confirm app goal and topology (single instance vs replica set vs vshard starter).
2. Propose directory layout: `tt.yaml`, instances, roles, migrations, tests.
3. Provide starter role/schema Lua and a minimal tap/luatest example.
4. Document local run commands with `tt` for developers.
