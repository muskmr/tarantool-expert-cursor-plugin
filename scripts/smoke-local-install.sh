#!/usr/bin/env bash
# Cloud/CI smoke test for local install layout (does not launch Cursor Desktop).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

echo "== validate template =="
node scripts/validate-template.mjs

echo "== install local =="
bash scripts/install-local.sh

DEST="${HOME}/.cursor/plugins/local/tarantool-expert"
fail=0

check() {
  local path="$1"
  if [[ -e "${path}" ]]; then
    echo "ok  ${path}"
  else
    echo "FAIL ${path}"
    fail=1
  fi
}

echo "== assert layout =="
check "${DEST}/.cursor-plugin/plugin.json"
check "${DEST}/assets/logo.png"
check "${DEST}/skills/tarantool-repo-analysis/SKILL.md"
check "${DEST}/skills/tarantool-mermaid-diagrams/SKILL.md"
check "${DEST}/commands/analyze-tarantool-repo.md"
check "${DEST}/rules/tarantool-core.mdc"
check "${DEST}/agents/tarantool-architect.md"

NAME="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["name"])' "${DEST}/.cursor-plugin/plugin.json")"
LOGO="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["logo"])' "${DEST}/.cursor-plugin/plugin.json")"
if [[ "${NAME}" != "tarantool-expert" ]]; then
  echo "FAIL unexpected name: ${NAME}"
  fail=1
else
  echo "ok  name=${NAME}"
fi
if [[ "${LOGO}" != "assets/logo.png" ]]; then
  echo "FAIL unexpected logo: ${LOGO}"
  fail=1
else
  echo "ok  logo=${LOGO}"
fi

# Ensure not a broken symlink
if [[ -L "${DEST}" ]]; then
  target="$(readlink "${DEST}")"
  case "${target}" in
    "${HOME}/.cursor/plugins/local"/*|*/.cursor/plugins/local/*) echo "ok  symlink inside local plugins" ;;
    *)
      echo "FAIL symlink points outside local plugins: ${target}"
      fail=1
      ;;
  esac
else
  echo "ok  real directory (not symlink)"
fi

if [[ "${fail}" -ne 0 ]]; then
  echo
  echo "Smoke test FAILED"
  exit 1
fi

echo
echo "Smoke test PASSED (package + local install layout)."
echo "Cursor Desktop UI still needs a manual Reload Window check on your machine."
