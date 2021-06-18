#!/bin/bash

function usage () {
    cat << EOF
Usage: code-print.sh [-h] [--help] <input-filename>

Parameters:
    <input-filename> : A text based file.
EOF
}

function die () {
    echo "${1}" > /dev/stderr
    exit 1
}

case $1 in
    -h|--help)
        usage
        exit
    ;;
    *) ;;
esac

if ! [ -f "${1}" ]; then
    usage
    die ""
fi

tmp_ps=/tmp/code-print.ps

nvim "${1}" -c "hardcopy > ${tmp_ps} | q"

ps2pdf "${tmp_ps}" $(basename "${1%%.*}.pdf")
