#!/usr/bin/env bash

cmd='playerctl -p spotify'

playerctlstatus=$($cmd status 2> /dev/null)

prefix="%{A1:i3-msg workspace 11:}󰎈"
text=""
suffix="%{A}"

if [[ `playerctl -l 2> /dev/null` == *spotify* ]]; then
    artist=$($cmd metadata xesam:artist)
    title=$($cmd metadata xesam:title)
    text=" $artist - $title"
else
    text=""
fi

echo $prefix$text$suffix
