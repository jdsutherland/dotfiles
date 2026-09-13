#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ID="reidenxerx.keyboard-cleaner"
PLUGIN_URL="https://github.com/ReidenXerx/omarchy-keyboard-cleaner.git"
PLUGIN_DIR="$HOME/.config/omarchy/plugins/$PLUGIN_ID"
SHELL_JSON="$HOME/.config/omarchy/shell.json"

info() { printf '\n\033[0;34m==> %s\033[0m\n' "$*"; }

# Install (or update) the plugin files, but do not rely on `--enable`: for a
# plugin that is both overlay and bar-widget, Omarchy enables it by adding the
# widget to the bar. This setup wants the overlay enabled without a bar icon, so
# shell.json is normalized explicitly below.
if [[ -d "$PLUGIN_DIR/.git" ]]; then
  info "Updating keyboard cleaner plugin"
  omarchy plugin update "$PLUGIN_ID" --yes >/dev/null
else
  if [[ -e "$PLUGIN_DIR" ]]; then
    backup="$PLUGIN_DIR.bak.$(date +%Y%m%d-%H%M%S)"
    info "Moving invalid keyboard cleaner plugin aside: $backup"
    mv "$PLUGIN_DIR" "$backup"
  fi
  info "Installing keyboard cleaner plugin"
  omarchy plugin add "$PLUGIN_URL" --yes >/dev/null
fi

info "Configuring keyboard cleaner as overlay-only"
python - <<'PY'
import json
from pathlib import Path

plugin = "reidenxerx.keyboard-cleaner"
p = Path.home() / ".config" / "omarchy" / "shell.json"

if p.exists():
    data = json.loads(p.read_text())
else:
    data = {"version": 1}

bar = data.setdefault("bar", {})
layout = bar.setdefault("layout", {})
for section in ("left", "center", "right"):
    entries = layout.get(section, [])
    if isinstance(entries, list):
        layout[section] = [
            e for e in entries
            if not (isinstance(e, dict) and e.get("id") == plugin)
        ]

plugins = data.setdefault("plugins", [])
if not isinstance(plugins, list):
    plugins = data["plugins"] = []
if not any(isinstance(e, dict) and e.get("id") == plugin for e in plugins):
    plugins.append({"id": plugin})

p.parent.mkdir(parents=True, exist_ok=True)
p.write_text(json.dumps(data, indent=2) + "\n")
PY

# Pick up the symlinked SUPER+SPACE menu entry and the shell.json normalization.
omarchy menu refresh >/dev/null 2>&1 || true
omarchy restart shell >/dev/null 2>&1 || true
