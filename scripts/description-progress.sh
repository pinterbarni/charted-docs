#!/usr/bin/env bash
#
# Reports how many pages per language have a real description.
# A description is missing if the key is absent, empty or still the placeholder.

# shellcheck source-path=SCRIPTDIR
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR
readonly DOCS_DIR="$SCRIPT_DIR/../docs"

# shellcheck source=lib/front-matter.sh
source "$SCRIPT_DIR/lib/front-matter.sh"
# shellcheck source=lib/report.sh
source "$SCRIPT_DIR/lib/report.sh"

is_missing_description() {
  local description
  description=$(front_matter_value "$1" "description")
  [[ -z "$description" || "$description" == "$DESCRIPTION_PLACEHOLDER" ]]
}

main() {
  report_progress "Description progress" "$DOCS_DIR" is_missing_description
}

main "$@"
