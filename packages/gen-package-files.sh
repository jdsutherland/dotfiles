#!/bin/sh
set -euo pipefail

# Generates package files for homebrew, npm, pip, gem, and go.
# Intended use for installing packages from fresh install.

# mkdir with timestamp to avoid collisions
outdir=$HOME/.dotfiles/packages/$(date +%Y_%m_%d_%H%M%S)

_gen_brewfile() {
  brewfile=Brewfile

  brew bundle dump --file="$outdir/$brewfile"
}

_gen_pipfile() {
  pipfile=Pipfile

  pip freeze > "$outdir/$pipfile"
}

_gen_gemfile() {
  gemfile=Gemfile

  gem list | cut -d ' ' -f 1 >  "$outdir/$gemfile"
}

_gen_gofile() {
  gofile=Gofile

  go list all > "$outdir/$gofile"
  sed -i '' 's/^github/github/gp;d' "$outdir/$gofile"
}

_gen_npmfile() {
  npmfile=Npmfile

  ls "$(npm root -g)" > "$outdir/$npmfile"
  sed -i '' 's|/||g' "$outdir/$npmfile"
}

generate_package_files() {
  mkdir "$outdir" || exit 1
  echo "Generating package files to $outdir"
  echo
  _gen_brewfile
  _gen_pipfile
  _gen_gemfile
  _gen_gofile
  _gen_npmfile
  echo
  echo "Finished generating package files to $outdir"
}

generate_package_files

exit 0
