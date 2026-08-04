# Security policy

## Scope of this repository

**Tarantool IS Expert** is a Cursor Marketplace plugin made of static markdown assets
(rules, skills, agents, commands, Mermaid templates). It:

- does **not** ship an MCP server or hooks that execute code automatically
- does **not** bundle Tarantool binaries or npm runtime dependencies for the plugin
- does **not** collect telemetry or require API tokens

Installed skills guide Cursor Agent when working in a user's Tarantool project.
The Agent still runs under the user's Cursor permissions and local environment.

## What we intentionally avoid

- Live connections to production / high-load Tarantool clusters
- Hardcoded credentials, connection strings, or sample secrets that look real
- `curl | bash`, privilege escalation, or destructive shell recipes
- Prompt text that overrides user intent or disables safety checks

## Reporting a vulnerability

If you believe this repository contains a security issue (for example, guidance that
could cause credential leakage or unsafe automation), email **muskmr@gmail.com**
with:

1. Description of the issue
2. Affected file paths
3. Potential impact

Please do not open a public issue for sensitive reports until we have confirmed a fix.

## Maintainer checklist before marketplace updates

1. `node scripts/validate-template.mjs`
2. Grep for secrets: passwords, tokens, private keys, `.pem`
3. Confirm no `mcp.json` / `hooks/` were added accidentally (or review them carefully if intentional)
4. Confirm `NOTICE` still states independent community status
5. Confirm logo path in `plugin.json` resolves
