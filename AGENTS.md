# AGENTS.md

## Repository

This repository is a **Cursor Marketplace plugin** (not a VS Code extension). Layout follows https://github.com/cursor/plugin-template.

- Marketplace manifest: `.cursor-plugin/marketplace.json`
- Plugin: `plugins/tarantool-expert/`
- Validate: `node scripts/validate-template.mjs`

## Content guidelines

- Prefer official Tarantool terminology from https://github.com/tarantool/doc
- Keep guidance oriented to **repositories and local/dev** workflows
- Do not add live high-load cluster MCP tooling unless explicitly requested
- Mermaid diagrams must use templates under `skills/tarantool-mermaid-diagrams/templates/`
- Never commit secrets; keep samples placeholder-only
- Before marketplace updates: `SECURITY.md` maintainer checklist + `npm run validate`

## Author

- muskmr \<muskmr@gmail.com\>
- License: MIT
