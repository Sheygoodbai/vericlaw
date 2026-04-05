#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN_DIR="$ROOT_DIR/clawhub/vericlaw-plugin"
SOURCE_PATH="clawhub/vericlaw-plugin"
TAGS="${CLAWD_TAGS:-latest}"

if [[ ! -d "$PLUGIN_DIR" ]]; then
  echo "[vericlaw-clawhub] missing plugin dir: $PLUGIN_DIR" >&2
  exit 1
fi

if ! command -v clawhub >/dev/null 2>&1; then
  echo "[vericlaw-clawhub] clawhub CLI is not installed; skipping publish" >&2
  exit 0
fi

if ! clawhub whoami >/dev/null 2>&1; then
  echo "[vericlaw-clawhub] clawhub CLI is not logged in; skipping publish" >&2
  exit 0
fi

remote_url="$(git -C "$ROOT_DIR" remote get-url origin 2>/dev/null || true)"
if [[ -z "$remote_url" ]]; then
  echo "[vericlaw-clawhub] missing origin remote; skipping publish" >&2
  exit 0
fi

source_repo="$(
  node - <<'NODE' "$remote_url"
const remoteUrl = process.argv[2] || "";
const trimmed = remoteUrl
  .trim()
  .replace(/^git\+/, "")
  .replace(/\.git$/i, "")
  .replace(/^git@github\.com:/i, "https://github.com/");

if (!trimmed) {
  process.exit(1);
}

const shorthand = trimmed.match(/^([A-Za-z0-9_.-]+)\/([A-Za-z0-9_.-]+)$/);
if (shorthand) {
  console.log(`${shorthand[1]}/${shorthand[2]}`);
  process.exit(0);
}

try {
  const parsed = new URL(trimmed);
  if (!/^github\.com$/i.test(parsed.hostname) && !/^www\.github\.com$/i.test(parsed.hostname)) {
    process.exit(1);
  }
  const parts = parsed.pathname.split("/").filter(Boolean);
  if (parts.length < 2) {
    process.exit(1);
  }
  console.log(`${parts[0]}/${parts[1].replace(/\.git$/i, "")}`);
} catch {
  process.exit(1);
}
NODE
)"

source_commit="$(git -C "$ROOT_DIR" rev-parse HEAD)"
source_ref="$(
  git -C "$ROOT_DIR" describe --tags --exact-match 2>/dev/null ||
  git -C "$ROOT_DIR" branch --show-current 2>/dev/null ||
  printf '%s' "$source_commit"
)"

major_minor="$(
  node - <<'NODE' "$PLUGIN_DIR/package.json"
const pkg = require(process.argv[2]);
const version = pkg.version || "";
const match = version.match(/^(\d+)\.(\d+)\.(\d+)/);
if (!match) {
  throw new Error(`Unsupported semver version: ${version}`);
}
console.log(`${match[1]}.${match[2]}`);
NODE
)"

utc_stamp="$(date -u +%Y%m%d%H%M%S)"
version="${1:-${major_minor}.9${utc_stamp}}"

echo "[vericlaw-clawhub] publishing $source_repo@$source_ref:$SOURCE_PATH as $version"

exec npx -y clawhub@0.9.0 package publish "$PLUGIN_DIR" \
  --source-repo "$source_repo" \
  --source-commit "$source_commit" \
  --source-ref "$source_ref" \
  --source-path "$SOURCE_PATH" \
  --version "$version" \
  --tags "$TAGS"
