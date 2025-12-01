#!/usr/bin/env sh

set -eu

. ./restic-env.sh

restic forget --prune --verbose \
    --keep-hourly 48 --keep-daily 7 --keep-weekly 4 \
    --keep-monthly 12 --keep-yearly 10
