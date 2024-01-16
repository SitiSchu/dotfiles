#!/usr/bin/env bash

if [[ $(brightnessctl -c backlight g) == 0 ]]; then
    brightnessctl -c backlight -r
else
    brightnessctl -c backlight -s
    brightnessctl -c backlight s 0
fi

