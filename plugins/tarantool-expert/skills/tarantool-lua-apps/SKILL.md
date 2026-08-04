---
name: tarantool-lua-apps
description: Build Tarantool Lua applications — modules, roles, fibers/cooperative multitasking, stored procedures, logging, and app structure for tt/3.x projects.
---

# Tarantool Lua applications

Canonical: `platform/app/*`, `platform/app/coop_multitasking`, Lua style guide.

## App shapes

1. **Roles** (Tarantool 3.x) — reusable role modules enabled from YAML config
2. **Classic init.lua** — `box.cfg` then create schema / start fibers
3. **Stored procedures** — functions called via net.box / iproto `call`
4. **Rocks** — shareable libraries via rockspec

## Cooperative multitasking

- Work runs in **fibers**; CPU-heavy or long loops must yield
- Prefer Tarantool async I/O APIs; avoid blocking the event loop
- Use `fiber`, `fiber.channel`, `fiber.cond` for coordination
- Transactions should be short; understand default vs MVCC transaction modes

## Module pattern

```lua
local M = {}

function M.start(opts)
    opts = opts or {}
    -- validate opts, create fibers
    return true
end

function M.stop()
    return true
end

return M
```

## Error handling

```lua
local tuple, err = space:insert({...})
if tuple == nil then
    return nil, err
end
```

Apply `lua-tarantool-style` rule. Pair with `tarantool-testing` for tap/luatest coverage.
