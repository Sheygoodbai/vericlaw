#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
SUPPLEMENTAL_SITEMAP="${REPO_DIR}/docs/sitemap-supplemental.xml"

KEY="3edbda11b06737f28b1454ffb83c02fe"
HOST="sheygoodbai.github.io"
SITE_PREFIX="https://${HOST}/vericlaw"
KEY_LOCATION="${SITE_PREFIX}/${KEY}.txt"
ENDPOINT="${INDEXNOW_ENDPOINT:-https://api.indexnow.org/indexnow}"

default_urls=(
  "${SITE_PREFIX}/"
  "${SITE_PREFIX}/download/"
  "${SITE_PREFIX}/openclaw-plugin/"
  "${SITE_PREFIX}/clawhub-skill/"
  "${SITE_PREFIX}/ai-agent-correction/"
  "${SITE_PREFIX}/ai-hallucination-remediation/"
  "${SITE_PREFIX}/agent-supervision/"
  "${SITE_PREFIX}/hallucination-checker/"
)

load_supplemental_urls() {
  if [ ! -f "${SUPPLEMENTAL_SITEMAP}" ]; then
    return 0
  fi

  sed -n 's#.*<loc>\(.*\)</loc>.*#\1#p' "${SUPPLEMENTAL_SITEMAP}"
}

build_default_urls() {
  {
    printf '%s\n' "${default_urls[@]}"
    load_supplemental_urls
  } | awk 'NF && !seen[$0]++'
}

if [ "$#" -gt 0 ]; then
  urls=("$@")
else
  urls=()
  while IFS= read -r url; do
    urls+=("${url}")
  done < <(build_default_urls)
fi

if ! curl -fsS "${KEY_LOCATION}" >/dev/null; then
  echo "IndexNow key file is not live yet: ${KEY_LOCATION}" >&2
  echo "Deploy the docs site first, then rerun this script." >&2
  exit 1
fi

url_json=""
for url in "${urls[@]}"; do
  if [ -n "${url_json}" ]; then
    url_json="${url_json},\n"
  fi
  url_json="${url_json}    \"${url}\""
done

payload=$(
  printf '{\n  "host": "%s",\n  "key": "%s",\n  "keyLocation": "%s",\n  "urlList": [\n%b\n  ]\n}\n' \
    "${HOST}" \
    "${KEY}" \
    "${KEY_LOCATION}" \
    "${url_json}"
)

curl -fsS \
  -H 'Content-Type: application/json; charset=utf-8' \
  --data "${payload}" \
  "${ENDPOINT}"

printf '\nSubmitted %s URL(s) to %s\n' "${#urls[@]}" "${ENDPOINT}"
