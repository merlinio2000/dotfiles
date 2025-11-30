#!/usr/bin/env sh

export RESTIC_REPOSITORY='rest:http://bupps.sexy:8000/merlinio'
export RESTIC_PASSWORD_COMMAND='pass restic/repo-password'
export RESTIC_REST_USERNAME='merlinio'
RESTIC_REST_PASSWORD="$(pass restic/merlinio-password)"
export RESTIC_REST_PASSWORD
