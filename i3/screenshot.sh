#!/bin/sh

resolution=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

save_dir=~/Pictures/Screenshots
mkdir -p $save_dir

screenshot=$save_dir/Screenshot_$(date +"%Y-%m-%dT%H:%M:%SZ").jpeg

ffmpeg -f x11grab -video_size $resolution -y -i $DISPLAY -vframes 1 $screenshot -loglevel quiet
