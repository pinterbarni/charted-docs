# Shared helpers for the progress scripts. Sourced, not run directly.

# Work from the repo root, wherever the script was started from.
cd "$(dirname "${BASH_SOURCE[0]}")/../.."

width=20

# Succeeds if the front matter (between the first two --- lines) contains the given line exactly.
has_front_matter_line() {
  awk -v want="$2" 'NR == 1 { if ($0 != "---") exit; next }
       $0 == "---" { exit }
       $0 == want { found = 1; exit }
       END { exit !found }' "$1"
}

bar() {
  local pct=$1 filled=$(( $1 * width / 100 )) out=''
  for ((i = 0; i < width; i++)); do
    if (( i < filled )); then out+='█'; else out+='░'; fi
  done
  printf '%s %3d%%' "$out" "$pct"
}

percent() {
  if (( $2 > 0 )); then echo $(( $1 * 100 / $2 )); else echo 0; fi
}

# Usage: report_progress <title> <unfinished marker line>
# Counts pages per language whose front matter does not contain the marker,
# prints one line per language, and writes a table to the GitHub job summary in CI.
report_progress() {
  local title=$1 marker=$2
  local report="### $title"$'\n\n'"| Language | Done | Total | Progress |"$'\n'"|---|---|---|---|"$'\n'
  local lang name total open file done pct
  for lang in hu en; do
    case $lang in hu) name='Magyar' ;; en) name='English' ;; esac
    total=0
    open=0
    while IFS= read -r -d '' file; do
      total=$(( total + 1 ))
      if has_front_matter_line "$file" "$marker"; then open=$(( open + 1 )); fi
    done < <(find docs -name "*.$lang.md" -print0 2>/dev/null)
    done=$(( total - open ))
    pct=$(percent "$done" "$total")
    echo "$title, $name: $done/$total $(bar "$pct")"
    report+="| $name | $done | $total | \`$(bar "$pct")\` |"$'\n'
  done
  if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then
    printf '%s\n' "$report" >> "$GITHUB_STEP_SUMMARY"
  fi
}
