#!/usr/bin/env bash

## This script checks if the x server is running, a display is set and if the
# xhost command is available.

set -euo pipefail

echoerr (){ printf "%s" "$@" >&2;}
exiterr (){ printf "%s\n" "$@" >&2; exit 1;}

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [[ $(pgrep -x "Xorg") && -n "$DISPLAY" && $(command -v xhost) ]]; then
    echo "X server is running, DISPLAY is set, and xhost is available."
else
    echo "One or more conditions are not met."
fi
