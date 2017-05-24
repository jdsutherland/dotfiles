#!/bin/bash
# set -euo pipefail

# install_package_files.sh <path>
#
# Installs package files for homebrew, npm, pip, gem, and go.
# Intended use for installing packages from fresh install.
#
# NOTE: depends on package files being created from install-package-files.sh

path="$1"

if [ -z "$path" ]; then
  echo "Usage: install_package_files.sh <path>"; exit 1
fi

_install_brewfile() {
  brewfile=Brewfile
  printf "Installing Homebrew packages:\n"

  brew bundle --file="$path/$brewfile"
}

_install_pipfile() {
  pipfile=Pipfile
  printf "Installing pip packages:\n"

  pip install -r "$path/$pipfile"
}

_install_gemfile() {
  gemfile=Gemfile
  printf "Installing gems:\n"

  while read -r line || [[ -n $line ]]; do
    sudo gem install "$line"
  done < "$path/$gemfile"
}

_install_gofile() {
  gofile=Gofile
  printf "Installing go packages:\n"

  while read -r line || [[ -n $line ]]; do
    go get -v "$line"
  done < "$path/$gofile"
}

_install_npmfile() {
  npmfile=Npmfile
  printf "Installing npm packages:\n"

  while read -r line || [[ -n $line ]]; do
    echo "$line"
    echo
    sudo npm install -g "$line"
  done < "$path/$npmfile"
}

install_package_files() {
  echo "Installing packages from $path"
  echo
  _install_brewfile
  _install_pipfile
  _install_gemfile
  _install_gofile
  _install_npmfile
  echo
  echo "Finished installing packages from $path"
}

install_package_files

exit 0
