# shellcheck shell=bash
#
# Formatting helpers for progress output. Sourced, never run directly.

[[ "${BASH_SOURCE[0]}" != "$0" ]] || { echo "Source this file, don't run it." >&2; exit 1; }

readonly PROGRESS_BAR_WIDTH=20
readonly PROGRESS_BAR_FILLED='█'
readonly PROGRESS_BAR_EMPTY='░'

# Prints finished as a whole percentage of total, or 0 when total is 0.
percent() {
  local finished=$1 total=$2
  if (( total > 0 )); then
    printf '%d' $(( finished * 100 / total ))
  else
    printf '0'
  fi
}

# Prints a text progress bar with the percentage, example "██████░░░░░░  30%".
progress_bar() {
  local pct=$1
  local filled=$(( pct * PROGRESS_BAR_WIDTH / 100 ))
  local bar='' i
  for (( i = 0; i < PROGRESS_BAR_WIDTH; i++ )); do
    if (( i < filled )); then bar+=$PROGRESS_BAR_FILLED; else bar+=$PROGRESS_BAR_EMPTY; fi
  done
  printf '%s %3d%%' "$bar" "$pct"
}
