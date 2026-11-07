# shellcheck shell=bash
#
# Progress report runner. Sourced, never run directly.

[[ "${BASH_SOURCE[0]}" != "$0" ]] || { echo "Source this file, don't run it." >&2; exit 1; }

# shellcheck source-path=SCRIPTDIR source=config.sh
source "$(dirname "${BASH_SOURCE[0]}")/config.sh"
# shellcheck source-path=SCRIPTDIR source=format.sh
source "$(dirname "${BASH_SOURCE[0]}")/format.sh"

# Prints how many pages of one language are finished, as "<finished> <total>".
# Usage: count_pages <docs dir> <locale> <unfinished check function>
count_pages() {
  local docs_dir=$1 locale=$2 is_unfinished=$3
  local total=0 unfinished=0 file
  while IFS= read -r -d '' file; do
    total=$(( total + 1 ))
    if "$is_unfinished" "$file"; then
      unfinished=$(( unfinished + 1 ))
    fi
  done < <(find "$docs_dir" -name "*.$locale.md" -print0 2>/dev/null)
  printf '%d %d\n' $(( total - unfinished )) "$total"
}

# Appends Markdown to the GitHub job summary. Does nothing outside GitHub Actions.
write_summary() {
  [[ -n "${GITHUB_STEP_SUMMARY:-}" ]] || return 0
  printf '%s\n' "$@" >> "$GITHUB_STEP_SUMMARY"
}

# Prints one progress line per language, and writes a table to the job summary in CI.
# Usage: report_progress <title> <docs dir> <unfinished check function>
report_progress() {
  local title=$1 docs_dir=$2 is_unfinished=$3
  local entry locale name finished total bar

  write_summary "### $title" "" "| Language | Done | Total | Progress |" "|---|---|---|---|"

  for entry in "${LANGUAGES[@]}"; do
    locale=${entry%%:*}
    name=${entry#*:}
    read -r finished total < <(count_pages "$docs_dir" "$locale" "$is_unfinished")
    bar=$(progress_bar "$(percent "$finished" "$total")")
    printf '%s, %s: %d/%d %s\n' "$title" "$name" "$finished" "$total" "$bar"
    write_summary "| $name | $finished | $total | \`$bar\` |"
  done

  write_summary ""
}
