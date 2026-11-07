# shellcheck shell=bash
#
# Values shared by the progress scripts. Sourced, never run directly.
#
# The constants are used by the files that source this one, so ShellCheck's
# "appears unused" warning (SC2034) is disabled for this file.

# shellcheck disable=SC2034

[[ "${BASH_SOURCE[0]}" != "$0" ]] || { echo "Source this file, don't run it." >&2; exit 1; }

# Languages in report order, as "locale:display name".
# Must match the languages in config/plugins.yml.
readonly LANGUAGES=("hu:Magyar" "en:English")

# Front matter line marking a page whose content isn't written yet.
readonly TODO_MARKER="todo: true"

# Description value marking a page whose description isn't written yet.
readonly DESCRIPTION_PLACEHOLDER="TODO"
