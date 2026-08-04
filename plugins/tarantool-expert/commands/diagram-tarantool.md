---
name: diagram-tarantool
description: Generate canonical Mermaid diagrams for Tarantool architecture, data model, or flows
---

# Diagram Tarantool

Use `tarantool-mermaid-diagrams` and the `mermaid-tarantool` rule.

1. Ask which diagram family is needed (or infer): topology, vshard, request flow, persistence, bucket states, schema ER, migration sequence.
2. Copy the matching template and fill real instance/space names from the repo or user input.
3. Keep node IDs Mermaid-safe; use canonical Tarantool terms only.
4. Briefly explain the diagram in prose under the Mermaid block.
