#!/usr/bin/env bash
# git "clean" filter: rewrite this machine's absolute home directory to the
# literal string $HOME on its way into the index.
#
# Some app-managed config files (claude/settings.json in particular) are
# rewritten by the running application, which resolves $HOME to an absolute
# path -- /home/j on Omarchy, /Users/j on macOS. Committing that path breaks
# the other machine, and it's easy to miss: the app can rewrite the file
# between an edit and a `git add`, which is exactly how it slipped in once.
#
# Registered per-file in .gitattributes and wired up by scripts/install.sh
# and scripts/omarchy.sh. Filter config lives in .git/config, which isn't
# version controlled, so a fresh clone must run one of those scripts before
# the filter takes effect.
#
# Deliberately not marked `required` in git config: an unconfigured clone
# should pass content through unchanged rather than fail `git checkout`
# during bootstrap.
set -euo pipefail

# The command substitution strips trailing newlines and printf restores
# exactly one. That also normalizes the missing final newline these
# app-written files tend to have, which would otherwise leave the file
# showing as modified forever even when nothing meaningful changed.
content="$(sed "s|${HOME%/}|\$HOME|g")"
printf '%s\n' "$content"
