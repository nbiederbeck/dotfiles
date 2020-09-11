#!/bin/bash
usage="Usage: reminder.sh [-h] MINUTES REMINDER"
help="""
${usage}

Get reminded to REMINDER in MINUTES minutes.
"""

set -eo pipefail

if [[ $1 == "-h" ]]; then
    echo "${help}"
    exit
elif [[ ($1 == "") || ($2 == "")  ]]; then
    echo "${usage}"
    exit
fi


(( sleeptime = $1 * 60 ))

echo "Reminding in ${sleeptime} seconds ($1 minutes)"

sleep "${sleeptime}" && notify-send "reminder.sh" "$2"
