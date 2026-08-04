# Cursor Marketplace submission checklist

Use before submitting https://github.com/muskmr/tarantool-expert-cursor-plugin to
https://cursor.com/marketplace/publish

## Plugin package

- [x] `.cursor-plugin/marketplace.json` present with unique kebab-case names
- [x] `plugins/tarantool-expert/.cursor-plugin/plugin.json` valid
- [x] `name`, `description`, `author`, `license`, `keywords`, `logo` set
- [x] Rules / skills / agents / commands have required YAML frontmatter
- [x] Logo committed and referenced by relative path (`assets/logo.png`)
- [x] `README.md` documents scope and usage
- [x] `NOTICE` clarifies community/trademark/docs attribution
- [x] `node scripts/validate-template.mjs` passes
- [x] No MCP / hooks in v0.1 (knowledge-only)

## Security / trust

- [x] No secrets in git history for this plugin pack
- [x] No runtime dependencies in root `package.json`
- [x] Skills discourage committing credentials
- [x] Upgrade/migration guidance is planning-oriented, not live prod ops
- [x] `SECURITY.md` present

## GitHub repository hygiene (manual)

Do these in GitHub Settings (API token for this agent is read-only):

- [ ] Repo description: clear marketplace blurb (replace placeholder text if still present)
- [ ] Topics: `cursor`, `cursor-plugin`, `tarantool`, `lua`, `mermaid`
- [ ] Homepage: `https://www.tarantool.io/en/doc/latest/` or this README
- [ ] Confirm LICENSE detected as MIT
- [ ] Keep repository **public**
- [ ] Optional: enable Dependabot / secret scanning (low urgency — no deps)

Suggested description:

> Cursor Marketplace plugin: Tarantool IS Expert — knowledge pack for designing, reviewing, migrating, and documenting Tarantool apps in Cursor.
