# Hello Cursor

A minimal starter [Cursor](https://cursor.com) / VS Code extension scaffold. Cursor extensions use the
VS Code extension API, so this project can be developed, tested, and packaged with the standard VS Code
extension toolchain and published to the marketplace.

This scaffold exists to validate the development environment. Rename/replace it with your real plugin.

## Prerequisites

- Node.js 20+ (this repo is developed on Node 22)
- npm

## Setup

```bash
npm install
```

## Develop

- `npm run compile` — type-check and build to `dist/`
- `npm run watch` — rebuild on change
- `npm run lint` — run ESLint over `src/`
- Press `F5` in Cursor/VS Code to launch an Extension Development Host and try the
  **Hello Cursor: Say Hello** command (from the Command Palette).

## Test

Integration tests run against a real editor instance downloaded by `@vscode/test-electron`:

```bash
npm test
```

In a headless environment (no display), run under a virtual framebuffer:

```bash
xvfb-run -a npm test
```

## Package (marketplace artifact)

```bash
npm run package
```

This produces a `.vsix` file — the artifact you upload to the marketplace (or install locally via
"Extensions: Install from VSIX..."). Set a real `publisher` in `package.json` before publishing.
