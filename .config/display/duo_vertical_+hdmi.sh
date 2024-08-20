#!/bin/sh
xrandr --output eDP-1 --mode 2880x1800 --pos 0x1506 --rotate normal \
    --output eDP-2 --mode 2880x1800 --pos 0x3306 --rotate normal \
    --output DP-1 --off --output DP-2 --off \
    --output HDMI-1 --primary --mode 3440x1440 --pos 2880x0 --rotate normal \
        --scale 1.6x1.6
