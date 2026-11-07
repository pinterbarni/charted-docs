# shellcheck shell=bash
#
# Front matter helpers. Sourced by the progress scripts, never run directly.
#
# Front matter is the block between the first two "---" lines, and only counts
# when the file starts with "---".

[[ "${BASH_SOURCE[0]}" != "$0" ]] || { echo "Source this file, don't run it." >&2; exit 1; }

# Prints the front matter lines of a file, without the "---" delimiters.
# Prints nothing if the file has no front matter.
front_matter() {
  local file=$1
  awk 'NR == 1 { if ($0 != "---") exit; next }
       $0 == "---" { exit }
       { print }' "$file"
}

# Succeeds if the front matter contains the given line exactly.
front_matter_has_line() {
  local file=$1 line=$2
  front_matter "$file" | grep --quiet --line-regexp --fixed-strings -- "$line"
}

# Prints the value of a front matter key, with leading whitespace removed.
# Prints nothing if the key is missing.
front_matter_value() {
  local file=$1 key=$2
  front_matter "$file" | awk -v key="$key" '
    index($0, key ":") == 1 {
      value = substr($0, length(key) + 2)
      sub(/^[ \t]+/, "", value)
      print value
      exit
    }'
}
