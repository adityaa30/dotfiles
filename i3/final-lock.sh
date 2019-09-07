#!/bin/sh

curr_dir=/home/aditya30/Documents/Projects/Others/dot-config-files/pokemon-i3lock
temp_background=$curr_dir/temp.png
scrap_dir=$curr_dir/scrapped-data

poke_name=`ls $scrap_dir | shuf -n 1`
lock_image=${scrap_dir}/${poke_name}

resolution=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

ffmpeg -f x11grab -video_size $resolution -y -i $DISPLAY -i $lock_image -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $temp_background -loglevel quiet 

# Lock the screen
i3lock -i $temp_background
rm $temp_background
