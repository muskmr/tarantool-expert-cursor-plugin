---
name: tarantool-testing
description: Test Tarantool Lua apps with tap/luatest patterns, schema fixtures, and CI-friendly checks for solution repositories.
---

# Testing Tarantool projects

Canonical: Lua style guide testing section; project harnesses (`luatest` commonly used in Tarantool ecosystem).

## Practices

1. Boot a clean temporary instance / use luatest hooks — never target shared prod data.
2. Create schema in fixtures; drop/recreate between tests when needed.
3. Test stored procedures and role start/stop.
4. Cover migration up/down or at least upgrade path smoke tests.
5. Assert on `nil, err` paths and `box.NULL` cases.

## Minimal tap sketch

```lua
#!/usr/bin/env tarantool
local tap = require("tap")
local test = tap.test("users")
test:plan(2)

-- box.cfg / schema setup here
local t = box.space.users:insert({1, "a@b.c", "Ada"})
test:ok(t ~= nil, "insert works")
test:is(box.space.users:get(1)[3], "Ada", "name stored")

os.exit(test:check() and 0 or 1)
```

Prefer the repo's existing harness if present.
