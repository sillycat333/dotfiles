#!/usr/bin/env bash

CURRENT_VOLUME = pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1

if [ $# -lt 2 ]; then
    echo "[Error] Usage: ./volume.sh up/down [value]"
    exit
fi

if [ "$1" = "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +$2%
elif [ "$1" = "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -$2%
else
    echo "[Error] $1 argument error"
fi
