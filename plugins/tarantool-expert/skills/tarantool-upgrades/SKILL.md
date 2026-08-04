---
name: tarantool-upgrades
description: Plan Tarantool binary/version upgrades for standalone and replica-set applications using official upgrade documentation — checklist-oriented for repos and staging.
---

# Version upgrades

Canonical: `doc/admin/upgrades*` in tarantool/doc.

## Principles

1. Read version-specific notes (schema/index/type fixes between releases).
2. Prefer upgrading replicas / followers before failover to new primaries (per official tutorial for the topology).
3. Run pre-upgrade checks from docs (schema compatibility scripts when provided).
4. Take backups/snapshots before upgrading staging; production cutover is an ops process outside this plugin's live scope.
5. After binary upgrade, follow schema upgrade steps required by the release.

## Deliverables in Cursor

- Version-from → version-to plan
- Ordered instance list for the project's topology
- Config/code changes required by the new version
- Test plan on local/`tt` environment
- Links to relevant official upgrade pages

Do not claim to perform online upgrades against unmanaged high-load clusters from this knowledge plugin.
