#!/usr/bin/env bash
#
# Runs every progress report, for local use.
# CI runs each report script as its own job instead.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR
readonly REPORTS=(content-progress.sh description-progress.sh)

main() {
  local report
  for report in "${REPORTS[@]}"; do
    bash "$SCRIPT_DIR/$report"
  done
}

main "$@"
