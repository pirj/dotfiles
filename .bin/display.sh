#!/bin/sh

VIDEO=`cat /tmp/video_out`
if [[ "$VIDEO" == IN ]]; then
    xrandr --output LVDS-0 --off --output VGA-0 --preferred
    echo "EX" > /tmp/video_out
else
    xrandr --output LVDS-0 --auto --output VGA-0 --auto
    echo "IN" > /tmp/video_out
fi
