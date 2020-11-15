#!/bin/bash
help="HELP:
./confirm.sh 'something-to-confirm'

Uses dmenu to ask for confirmation.
Default answer is 'NO'.
"
if [[ -z $1 ]]; then
    echo "${help}"
    exit 1
else
    printf "no\nyes" | dmenu -p "$1" | grep yes
fi
