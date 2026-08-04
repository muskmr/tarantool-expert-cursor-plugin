---
name: plan-migration
description: Plan schema migration or Tarantool version upgrade steps for this project
---

# Plan Tarantool migration / upgrade

Act as `tarantool-migrator`; use `tarantool-migrations` and `tarantool-upgrades`.

1. Determine whether this is a schema migration, data transform, binary upgrade, or combination.
2. Inventory current state from the repo.
3. Produce an ordered plan with verification and rollback.
4. Provide sample `tt` migration files or upgrade checklist adapted to the project.
