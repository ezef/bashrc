#!/bin/bash
#
# Brightness controller script using xrandr
# used with shortcut keys
# (I can't use the command directly on XFCE shortcut manager, so I've made this script)
#
# Usage:
# Increase brightness: bright.sh -o HDMI-1 -s 0.1
# Decrease brightness: bright.sh -o HDMI-1 -s -0.1

while getopts o:s: flag
do
    case "${flag}" in
        o) output=${OPTARG};;
        s) step=${OPTARG};;
    esac
done

if [ -n "$output" ] && [ -n "$step" ]; then
  xrandr --output $output --brightness $(echo "$(xrandr --verbose | grep $output -A 5 | grep Brightness |grep -o '[0-9].*') + $step" | bc)
fi