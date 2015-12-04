#!/bin/sh

VIDEO=`cat /tmp/video_out`
if [[ "$VIDEO" == IN ]]; then
    xrandr --output LVDS-1 --off --output VGA-1 --preferred
    echo "EX" > /tmp/video_out
else
    xrandr --output LVDS-1 --auto --output VGA-1 --auto
    echo "IN" > /tmp/video_out
fi
