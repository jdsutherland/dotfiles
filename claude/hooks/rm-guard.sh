#!/usr/bin/env bash
# PreToolUse (Bash) guard: force a confirmation prompt when an `rm` command
# targets a path OUTSIDE the project root. In-project rm passes through to
# normal permission handling (so it can still be auto-approved).
#
# Reads the hook JSON on stdin. To force a prompt it prints a PreToolUse
# permission decision as JSON and exits 0. Silence + exit 0 = defer.
#
# Best-effort heuristic, biased toward asking: anything it cannot confidently
# place inside the project root (variables, ~, absolute paths, .. escapes) ->
# ask. It is a safety net, not a sandbox.
set -uo pipefail

input="$(cat)"
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // ""')"

root="${CLAUDE_PROJECT_DIR:-$PWD}"
root="${root%/}"

ask() {
  jq -n --arg r "$1" '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"ask",permissionDecisionReason:$r}}'
  exit 0
}

# Space-pad shell separators so they tokenize, then walk tokens tracking which
# command word we are in. This handles chained commands (a && rm /x; rm y).
norm="$(printf '%s' "$cmd" | sed -E 's/(&&|\|\||[;&|()])/ \1 /g')"

expect_cmd=1   # next token is a command word
in_rm=0        # currently inside an rm command's arguments

for tok in $norm; do
  case "$tok" in
    ';'|'&'|'|'|'&&'|'||'|'('|')')
      expect_cmd=1; in_rm=0; continue ;;
  esac

  if [ "$expect_cmd" -eq 1 ]; then
    case "$tok" in
      sudo) continue ;;                 # keep expecting the command word
      rm)   in_rm=1; expect_cmd=0; continue ;;
      *)    in_rm=0; expect_cmd=0; continue ;;
    esac
  fi

  [ "$in_rm" -eq 1 ] || continue        # only inspect rm's own arguments
  case "$tok" in -*) continue ;; esac   # skip flags

  # strip one layer of surrounding quotes
  t="$tok"; t="${t%\"}"; t="${t#\"}"; t="${t%\'}"; t="${t#\'}"

  case "$t" in
    *'$'*)      ask "rm targets '$t' (shell variable/substitution) — can't verify it is inside the project root." ;;
    '~'|'~/'*)  ask "rm targets your home directory ('$t') — outside the project root." ;;
    /*)
      case "$t" in
        "$root"|"$root"/*) : ;;         # absolute, inside project root -> ok
        *) ask "rm targets '$t', outside the project root ($root)." ;;
      esac ;;
    *..*)       ask "rm targets '$t', which may escape the project root." ;;
    *) : ;;                             # plain relative path -> inside root
  esac
done

exit 0
