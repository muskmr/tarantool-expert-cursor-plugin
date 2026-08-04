# Template: master-master (use sparingly; document conflict policy)

```mermaid
flowchart LR
  ClientA[Client_A] --> MasterA[Master_A]
  ClientB[Client_B] --> MasterB[Master_B]
  MasterA <-->|"replication both ways"| MasterB
```

Notes:

- Prefer single-primary topologies unless the product explicitly needs multi-master.
- Call out conflict resolution (application triggers / last-writer rules) in prose.
