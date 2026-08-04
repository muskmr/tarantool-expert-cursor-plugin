# AGENTS.md

## Cursor Cloud specific instructions

This repository is a **Cursor/VS Code extension** (it uses the standard VS Code extension API, so Cursor
marketplace plugins are built, tested, and packaged with the normal VS Code extension toolchain).

Environment: Node 22 + `npm`. Dependencies install with `npm install` (already handled by the startup
update script when `package.json` is present).

Standard commands (see `package.json` scripts and `README.md`):

- Build: `npm run compile` (TypeScript → `dist/`); `npm run watch` for incremental builds.
- Lint: `npm run lint` (ESLint over `src/`).
- Package a marketplace artifact: `npm run package` → produces `hello-cursor-<version>.vsix`.

Non-obvious caveats for this cloud VM:

- Tests use `@vscode/test-electron`, which downloads and launches a real editor build. There is no display
  in the cloud VM, so run tests under a virtual framebuffer: `xvfb-run -a npm test`. A plain `npm test`
  will fail to launch the editor.
- During headless test runs the editor prints `dbus`/`gpu`/`Settings Sync` errors to stderr. These are
  harmless in this environment; rely on the mocha summary (e.g. `2 passing`) for pass/fail.
- No `code`/`cursor` CLI is installed, so the F5 "Extension Development Host" flow is not available
  headlessly. Validate behavior via the `@vscode/test-electron` suite (`xvfb-run -a npm test`) or by
  packaging the `.vsix` instead.
- Before publishing to the marketplace, set a real `publisher` in `package.json` (the scaffold uses the
  placeholder `your-publisher`).
