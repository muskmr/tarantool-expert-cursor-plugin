---
name: tarantool-security
description: Apply Tarantool authZ/authN and security hygiene in application configs — users, roles, privileges, listeners, and audit awareness for solution repos.
---

# Security basics

Canonical: `platform/connections_and_auth/*`, `platform/security/*`, admin access control.

## Repo-focused controls

1. Create least-privilege users for apps (not guest/superuser in deploy configs).
2. Grant only needed privileges on spaces/functions.
3. Separate listen sockets / SSL options per environment as supported.
4. Never commit passwords or tokens; provide `.env.example`.
5. Be aware of audit log modules in enterprise/community docs when the project enables them.

## Review flags

- World-readable config with secrets
- Over-broad `universe` grants in samples copied to deploy
- Public iproto without auth in non-local compose files
