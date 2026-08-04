---
name: tarantool-vshard
description: Design and review Tarantool vshard sharding — routers, storages, replica sets, virtual buckets, rebalancer, and sharded space rules.
---

# vshard sharding

Canonical: `platform/sharding/vshard_architecture`, `vshard_admin`, getting started sharded cluster.

## Building blocks

- **Router** — routes `vshard.router.call(bucket_id, mode, func, args)`
- **Storage** — holds a subset of buckets; usually in replica sets (recommend ≥2–3 members)
- **Bucket (virtual bucket)** — shard unit id in `1..bucket_count`
- **Rebalancer** — moves buckets when disbalance exceeds threshold
- System space `_bucket` tracks bucket status on storages

## Space rules

Every sharded space needs a numeric bucket id field. Writes must use the correct bucket. Routers may compute bucket id via crc32 helpers when schema rules are clear.

## Bucket states (diagram with stateDiagram)

`ACTIVE`, `PINNED`, `SENDING`, `RECEIVING`, `SENT`, `GARBAGE`

## Design tips

- Pick `bucket_count` >> expected node count (e.g. hundreds/thousands × nodes), not equal to node count
- Keep shard key stable forever
- Avoid multi-bucket transactions; use application-level workflows
- Start from Mermaid templates `vshard-cluster` and `bucket-states`

This skill helps design/review sharded apps in repos, not operate overloaded production rebalancing.
