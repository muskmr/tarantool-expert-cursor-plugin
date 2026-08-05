#!/usr/bin/env bash
# Install (or refresh) Tarantool IS Expert into Cursor's local plugin folder.
# Usage:
#   ./scripts/install-local.sh
#   ./scripts/install-local.sh --dry-run
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${ROOT}/plugins/tarantool-expert"
DEST_DIR="${HOME}/.cursor/plugins/local"
DEST="${DEST_DIR}/tarantool-expert"
DRY_RUN=0

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=1
fi

if [[ ! -f "${SRC}/.cursor-plugin/plugin.json" ]]; then
  echo "error: plugin manifest missing at ${SRC}/.cursor-plugin/plugin.json" >&2
  exit 1
fi

LOGO_REL="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1])).get("logo",""))' "${SRC}/.cursor-plugin/plugin.json")"
if [[ -z "${LOGO_REL}" || ! -f "${SRC}/${LOGO_REL}" ]]; then
  echo "error: plugin logo missing (plugin.json logo=${LOGO_REL:-unset})" >&2
  exit 1
fi

echo "source: ${SRC}"
echo "dest:   ${DEST}"
echo "logo:   ${LOGO_REL}"

if [[ "${DRY_RUN}" -eq 1 ]]; then
  echo "dry-run: would rsync plugin (with emblem) into local Cursor plugins folder"
  exit 0
fi

mkdir -p "${DEST_DIR}"
# Prefer a real copy: Cursor may reject symlinks that point outside ~/.cursor/plugins/local
rsync -a --delete \
  --exclude '.git/' \
  --exclude 'node_modules/' \
  "${SRC}/" "${DEST}/"

if [[ ! -f "${DEST}/${LOGO_REL}" ]]; then
  echo "error: logo was not copied to ${DEST}/${LOGO_REL}" >&2
  exit 1
fi

echo
echo "Installed with emblem: ${DEST}/${LOGO_REL}"
echo "Next steps in Cursor Desktop:"
echo "  1. Command Palette → Developer: Reload Window"
echo "  2. Open Customize → Plugins → Tarantool IS Expert (logo should show)"
echo "  3. In a Tarantool repo try: /analyze-tarantool-repo or /diagram-tarantool"
echo
echo "To remove: rm -rf \"${DEST}\""
