#!/bin/bash

set -eo pipefail

ask="Continue?"
ans=$(printf "%s\n%s" "yes" "no" | dmenu -p "${ask}")
if [[ "${ans}" == "no" ]]; then exit 1; fi

echo "Answer was given: ${ans}"
