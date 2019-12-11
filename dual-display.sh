#!/bin/bash

# Adds support for extra monitor places above the laptop's screen in i3wm

LAPTOP='eDP-1-1'
MONITOR='HDMI-0'

xrandr --output $MONITOR --mode 1920x1080 --rate 60
xrandr --output $LAPTOP --mode 1920x1080 --rate 60
xrandr --output $LAPTOP --below $MONITOR --auto
