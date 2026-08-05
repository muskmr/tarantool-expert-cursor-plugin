# How to run / test Tarantool IS Expert locally

This plugin is **not** a VS Code extension (no F5 / Extension Host).  
Cursor loads it as a marketplace-style plugin from disk or from the Marketplace install.

## 1) Validate package (CI-ish / cloud)

From the repo root:

```bash
npm run validate      # manifests + frontmatter
npm run smoke:local   # also copies into ~/.cursor/plugins/local and asserts layout
```

What cloud agents **can** test: package validity + local install filesystem layout (including logo).  
What cloud agents **cannot** test: Cursor Desktop Customize UI / Agent chat loading (no desktop Cursor host in the cloud VM).

## 2) Install into Cursor local plugins (recommended smoke test)

On the machine where Cursor Desktop runs:

```bash
git clone https://github.com/muskmr/tarantool-expert-cursor-plugin.git
cd tarantool-expert-cursor-plugin
./scripts/install-local.sh
```

What the script does:

- copies `plugins/tarantool-expert/` → `~/.cursor/plugins/local/tarantool-expert/`
- uses a **real copy** (not an external symlink — Cursor often rejects those)

Then in Cursor:

1. `Developer: Reload Window`
2. Open **Customize** (sidebar) → look for plugin components / skills / commands
3. Open a Tarantool project (or any repo) and try the prompts below

Re-run `./scripts/install-local.sh` after each content change, then Reload Window.

### Optional: marketplace install

If the plugin is already listed, install it from Marketplace / Customize and test the same prompts.  
For iterating on unpublished changes, prefer the local copy above (and temporarily disable the marketplace install to avoid confusion).

## 3) Smoke-test prompts

Run these in **Agent** chat (not just Tab):

| Check | Prompt / command |
| --- | --- |
| Repo analysis | `/analyze-tarantool-repo` or “Analyze this repo as a Tarantool project” |
| Schema design | `/design-schema` with a short product description |
| Topology + Mermaid | `/design-topology` or `/diagram-tarantool` — expect canonical terms (`ReplicaSet`, `Router`, `Bucket`, …) |
| Review | Open a Lua/`tt` diff and run `/review-tarantool` |
| Migration plan | `/plan-migration` |
| Skill discovery | Ask “What Tarantool skills do you have?” / invoke skill by name if UI lists it |

### Pass criteria

- Commands appear and produce Tarantool-specific guidance (not generic DB advice)
- Mermaid uses templates/vocabulary from the plugin (no invented cluster roles)
- No attempt to require a live MCP / production cluster connection
- Samples use placeholders for secrets (`CHANGE_ME`, env vars)

## 4) Manual UI checks in Customize

- Skills from `tarantool-*` are listed
- Rules can be toggled (none should force `Always` unless you set them)
- Agents `tarantool-architect` / `reviewer` / `migrator` are available if your Cursor build surfaces plugin agents
- Logo/name show as **Tarantool IS Expert** (hex badge) for both marketplace and local install

### Emblem / logo for local install

Yes — local plugins use the same `logo` field as marketplace ones:

```json
// plugins/tarantool-expert/.cursor-plugin/plugin.json
"logo": "assets/logo.png"
```

`./scripts/install-local.sh` copies `assets/logo.png` into `~/.cursor/plugins/local/tarantool-expert/assets/`. After **Reload Window**, Customize should show the emblem next to the plugin name.

To swap the badge: replace `plugins/tarantool-expert/assets/logo.png` (square PNG/SVG), keep the `logo` path in `plugin.json`, re-run `./scripts/install-local.sh`, Reload Window.

## 5) Tear down local install

```bash
rm -rf ~/.cursor/plugins/local/tarantool-expert
```

Then Reload Window.
