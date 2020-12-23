#!/bin/bash

set -eo pipefail

if [[ -z $NOTES_DIR ]]; then
    NOTES_DIR="$HOME/Dropbox/notes"
fi
if ! [[ -d $NOTES_DIR ]]; then
    mkdir -p "${NOTES_DIR}"
fi

today="$(date +'%Y-%m-%d')"
file="${NOTES_DIR}/${today}.md"

template="# Logbook ${today}

## Introduction
### Question
### Scope

## Methods
## Results
## Further Work
## Conclusion
## References

## To Do List
"

if ! [[ -f "${file}" ]]; then
    echo "${template}" > "${file}"
fi

if [[ -z $EDITOR ]]; then
    EDITOR=nano
fi

$EDITOR "${file}"
