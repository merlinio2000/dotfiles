#!/usr/bin/env sh

set -eu

# shellcheck source=./restic-env.sh
. "$HOME/dotfiles/restic/restic-env.sh"

restic --exclude-file "$HOME/dotfiles/restic/excludes.txt" backup "$HOME/Documents"
