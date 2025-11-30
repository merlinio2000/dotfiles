#!/usr/bin/env sh

set -eu

# shellcheck source=./restic-env.sh
. "$HOME/dotfiles/restic/restic-env.sh"

restic forget --prune \
    --keep-hourly 48 --keep-daily 7 --keep-weekly 4 \
    --keep-monthly 12 --keep-yearly 10
