#!/bin/bash
function usage () {
    cat <<EOF
Usage: $(basename $0) [-h|--help] [value]

Show the maximum cpu performance (in percent).

If 'value' is given, set the max_perf_pct.
EOF
    exit
}

if [ -z $1 ]; then  # if empty, show performance
    cat /sys/devices/system/cpu/intel_pstate/max_perf_pct
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then  # show help
    usage
elif [ $1 -gt 0 ]; then  # if number, set value
    echo $1 | sudo -k tee /sys/devices/system/cpu/intel_pstate/max_perf_pct
fi
