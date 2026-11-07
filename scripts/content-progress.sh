#!/usr/bin/env bash
#
# Reports how many pages per language have finished content.
# A page is unfinished while its front matter contains the todo marker.

# shellcheck source-path=SCRIPTDIR
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR
readonly DOCS_DIR="$SCRIPT_DIR/../docs"

# shellcheck source=lib/front-matter.sh
source "$SCRIPT_DIR/lib/front-matter.sh"
# shellcheck source=lib/report.sh
source "$SCRIPT_DIR/lib/report.sh"

is_unfinished_content() {
  front_matter_has_line "$1" "$TODO_MARKER"
}

main() {
  report_progress "Content progress" "$DOCS_DIR" is_unfinished_content
}

main "$@"
