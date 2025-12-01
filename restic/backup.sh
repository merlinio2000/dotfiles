#!/usr/bin/env sh

set -eu

. ./restic-env.sh

restic --exclude-file excludes.txt --verbose backup "$HOME/Documents"
