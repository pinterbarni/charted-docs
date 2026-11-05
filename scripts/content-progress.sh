#!/usr/bin/env bash
set -euo pipefail

width=20

# A page is unfinished if its front matter contains "todo: true".
is_todo() {
  awk 'NR == 1 { if ($0 != "---") exit; next }
       $0 == "---" { exit }
       $0 == "todo: true" { found = 1; exit }
       END { exit !found }' "$1"
}

bar() {
  local pct=$1 filled=$(( $1 * width / 100 )) out=''
  for ((i = 0; i < width; i++)); do
    if (( i < filled )); then out+='█'; else out+='░'; fi
  done
  printf '%s %3d%%' "$out" "$pct"
}

report="### Content progress"$'\n\n'"| Language | Done | Total | Progress |"$'\n'"|---|---|---|---|"$'\n'

for lang in hu en; do
  case $lang in hu) name='Magyar' ;; en) name='English' ;; esac
  total=0
  todo=0
  while IFS= read -r -d '' file; do
    total=$(( total + 1 ))
    if is_todo "$file"; then todo=$(( todo + 1 )); fi
  done < <(find docs -name "*.$lang.md" -print0 2>/dev/null)
  done=$(( total - todo ))
  pct=$(( total > 0 ? done * 100 / total : 0 ))
  echo "$name: $done/$total $(bar "$pct")"
  report+="| $name | $done | $total | \`$(bar "$pct")\` |"$'\n'
done

if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then
  printf '%s' "$report" >> "$GITHUB_STEP_SUMMARY"
fi
