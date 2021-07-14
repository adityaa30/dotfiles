#!/bin/bash

ALLOWED_POS=("--left-of" "--below" "--above" "--right-of")

# Check if arguments passed are OK
if [ $# -lt 2 -o $# -gt 3 ]
then
    echo "Usage: ./dual-display.sh <LAPTOP> <MONITOR> [${ALLOWED_POS[*]}]"
    exit
fi

# Adds support for extra monitor places above the laptop's screen in i3wm
LAPTOP=$1
MONITOR=$2
POS="--left-of"

if [ $# == 3 ]
then
    POS=$3
fi
xrandr --output $MONITOR --mode 1920x1080 --rate 60
xrandr --output $LAPTOP --mode 1920x1080 --rate 60
xrandr --output $LAPTOP $POS $MONITOR --auto
