#!/bin/bash

set -eu

function color() {
    # Usage: color "31;5" "string"
    # Some valid values for color:
    # - 5 blink, 1 strong, 4 underlined
    # - fg: 31 red,  32 green, 33 yellow, 34 blue, 35 purple, 36 cyan, 37 white
    # - bg: 40 black, 41 red, 44 blue, 45 purple
    printf '\033[%sm%s\033[0m\n' "$@"
}


# Check if an argument is provided
if [[ "$#" -lt 1 ]]; then
    color "31" "No process specified!"
    color "31" "Usage: ./prysm.sh PROCESS FLAGS."
    color "31" "PROCESS can be beacon-chain, validator, or client-stats."
    exit 1
fi

case $1 in
beacon-chain)
    readonly process=$BEACON_CHAIN_REAL
    ;;

validator)
    readonly process=$VALIDATOR_REAL
    ;;

client-stats)
    readonly process=$CLIENT_STATS_REAL
    ;;

*)
    color "31" "Process '$1' is not found!"
    color "31" "Usage: ./prysm PROCESS FLAGS."
    color "31" "PROCESS can be beacon-chain, validator, or client-stats."
    exit 1
    ;;
esac


if [[ "$#" -gt 1 ]] && [[ $2 == --download-only ]]; then
    color "37" "Only download operation is not supported by the snap, exit."
    exit 1
fi

color "36" "Starting Prysm $1 ${*:2}"
exec -a "$0" "${process}" "${@:2}"

