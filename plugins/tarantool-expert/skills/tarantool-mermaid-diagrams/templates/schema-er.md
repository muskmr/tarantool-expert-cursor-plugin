# Template: schema ER (spaces as entities)

```mermaid
erDiagram
  USERS ||--o{ ORDERS : places
  USERS {
    unsigned id PK
    string email UK
    string name
  }
  ORDERS {
    unsigned id PK
    unsigned user_id FK
    unsigned bucket_id
    number total
  }
```

Use field types from Tarantool formats (`unsigned`, `string`, `number`, `boolean`, `uuid`, `map`, `array`, …). Include `bucket_id` only for sharded spaces.
