#!/bin/sh
set -eu

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
skills_dir=${1:-${CODEX_HOME:-$HOME/.codex}/skills}
target=$skills_dir/strong-chancellor-community
for entry in SKILL.md README.md INSTALL.md CHANGELOG.md LICENSE NOTICE.md install.ps1 install.sh agents references tests; do
    if [ ! -e "$source_dir/$entry" ]; then
        printf 'Package is incomplete: %s\n' "$entry" >&2
        exit 1
    fi
done
if [ -e "$target" ] || [ -L "$target" ]; then
    printf 'Already installed: %s. No files changed. Back up and move the old folder outside the skills directory before upgrading.\n' "$target" >&2
    exit 1
fi
mkdir -p -- "$skills_dir"
mkdir -- "$target"
for entry in SKILL.md README.md INSTALL.md CHANGELOG.md LICENSE NOTICE.md install.ps1 install.sh agents references tests; do
    cp -R -- "$source_dir/$entry" "$target/"
done
printf 'Installed: %s\n' "$target"
printf 'Open a new Codex session and invoke $strong-chancellor-community.\n'
