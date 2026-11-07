#!/usr/bin/env bash
# Runs every progress report, for local use. CI runs each script as its own job.
set -euo pipefail
dir="$(dirname "${BASH_SOURCE[0]}")"

bash "$dir/content-progress.sh"
bash "$dir/description-progress.sh"
