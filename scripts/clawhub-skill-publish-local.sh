#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_DIR="$ROOT_DIR/clawhub/vericlaw-skill"
SKILL_FILE="$SKILL_DIR/SKILL.md"
SLUG="vericlaw"
DISPLAY_NAME="Official VeriClaw · Hallucination Correction / Verification Skill / AI幻觉纠偏"
TAGS="${CLAWD_TAGS:-latest}"

if [[ ! -f "$SKILL_FILE" ]]; then
  echo "[vericlaw-clawhub-skill] missing skill file: $SKILL_FILE" >&2
  exit 1
fi

if ! command -v clawhub >/dev/null 2>&1; then
  echo "[vericlaw-clawhub-skill] clawhub CLI is not installed; skipping publish" >&2
  exit 0
fi

if ! clawhub whoami >/dev/null 2>&1; then
  echo "[vericlaw-clawhub-skill] clawhub CLI is not logged in; skipping publish" >&2
  exit 0
fi

file_version="$(
  node - <<'NODE' "$SKILL_FILE"
const fs = require("fs");
const skillFile = process.argv[2];
const text = fs.readFileSync(skillFile, "utf8");
const match = text.match(/^version:\s*([0-9]+\.[0-9]+\.[0-9]+)\s*$/m);
if (!match) {
  throw new Error(`Could not find semver version in ${skillFile}`);
}
console.log(match[1]);
NODE
)"

remote_version="$(
  clawhub inspect "$SLUG" --json 2>/dev/null | node - <<'NODE' || true
let input = "";
process.stdin.setEncoding("utf8");
process.stdin.on("data", (chunk) => {
  input += chunk;
});
process.stdin.on("end", () => {
  try {
    const parsed = JSON.parse(input);
    const version = parsed?.latestVersion?.version || "";
    if (version) {
      process.stdout.write(version);
    }
  } catch {}
});
NODE
)"

version="${1:-}"
if [[ -z "$version" ]]; then
  version="$(
    node - <<'NODE' "$file_version" "$remote_version"
function parse(version) {
  const match = String(version || "").match(/^(\d+)\.(\d+)\.(\d+)$/);
  return match ? match.slice(1).map((part) => Number(part)) : null;
}

function compare(a, b) {
  for (let i = 0; i < 3; i += 1) {
    if (a[i] > b[i]) return 1;
    if (a[i] < b[i]) return -1;
  }
  return 0;
}

const fileVersion = process.argv[2];
const remoteVersion = process.argv[3];
const fileParts = parse(fileVersion);
if (!fileParts) {
  throw new Error(`Invalid file version: ${fileVersion}`);
}

const remoteParts = parse(remoteVersion);
if (!remoteParts) {
  process.stdout.write(fileVersion);
  process.exit(0);
}

if (compare(fileParts, remoteParts) > 0) {
  process.stdout.write(fileVersion);
  process.exit(0);
}

const next = [...remoteParts];
next[2] += 1;
process.stdout.write(next.join("."));
NODE
  )"
fi

changelog="${2:-}"

echo "[vericlaw-clawhub-skill] publishing $SLUG from $SKILL_DIR as $version"

publish_args=(
  publish
  "$SKILL_DIR"
  --slug "$SLUG"
  --name "$DISPLAY_NAME"
  --version "$version"
  --tags "$TAGS"
)

if [[ -n "$changelog" ]]; then
  publish_args+=(--changelog "$changelog")
fi

exec clawhub "${publish_args[@]}"
