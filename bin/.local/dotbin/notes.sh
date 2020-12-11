#!/bin/bash

today="$(date +'%Y-%m-%d')"
file="${today}.md"
template="# Logbook ${today}

## Introduction
### Question
### Scope

## Methods
## Results
## Further Work
## Conclusion
## References

## Todo List
"

# if ! [[ -f "${file}" ]]; then
#     echo "${template}" > "${file}"
# fi

# if set $EDITOR
echo "${file}"
