#!/bin/sh

VIDEO=`cat /tmp/video_out`
if [[ "$VIDEO" == IN ]]; then
    xrandr --output LVDS --off --output HDMI-0 --mode 1600x1200
    echo "EX" > /tmp/video_out
else
    xrandr --output LVDS --auto --output HDMI-0 --off
    echo "IN" > /tmp/video_out
fi
