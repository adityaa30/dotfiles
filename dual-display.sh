#!/bin/bash

# Check if arguments passed are OK

if [ $# != 2 ]
then
    echo "Usage: ./dual-display.sh <LAPTOP> <MONITOR>"
    exit
fi

# Adds support for extra monitor places above the laptop's screen in i3wm
LAPTOP=$1
MONITOR=$2

xrandr --output $MONITOR --mode 1920x1080 --rate 60
xrandr --output $LAPTOP --mode 1920x1080 --rate 60
xrandr --output $LAPTOP --below $MONITOR --auto
