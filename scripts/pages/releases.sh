#!/bin/bash
set -euo pipefail

url="https://api.github.com/repos/goreleaser/nfpm/releases/latest"
headers=(
  -H "Accept: application/vnd.github+json"
  -H "X-GitHub-Api-Version: 2022-11-28"
)

if [[ -n "${GITHUB_TOKEN:-}" ]]; then
  headers+=( -H "Authorization: Bearer ${GITHUB_TOKEN}" )
fi

curl -sSfL "${headers[@]}" "$url" |
	jq -r '.tag_name' >./www/static/latest
