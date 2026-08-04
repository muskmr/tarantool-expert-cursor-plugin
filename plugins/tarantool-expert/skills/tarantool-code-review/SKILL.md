---
name: tarantool-code-review
description: Review Tarantool-related changes for schema correctness, Lua/box.NULL safety, config/topology consistency, and migration risk.
---

# Tarantool code review

## Severity rubric

- **Blocker** — data loss/corruption risk, broken primary index, wrong bucket id writes, auth wide-open in deploy manifests
- **Major** — missing migrations, yield-unsafe loops, incorrect engine/index combo, replication misconfig in samples
- **Nit** — style, naming, comment gaps

## Pass order

1. Schema & indexes (engine compatibility)
2. Lua correctness (`nil`/`box.NULL`, errors, fibers)
3. Config/topology coherence
4. Migrations & upgrades impact
5. Tests updated?
6. Diagrams/docs still accurate?

Emit concrete patches. Use official terminology only.
