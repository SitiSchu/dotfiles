#!/usr/bin/env bash

function keypress {
    echo "press enter to continue..."
    read key
}

function basic_notifications {
    systemctl --user restart dunst
    dunstify -a "dunst tester"         "normal"    "<i>italic body</i>"
    dunstify -a "dunst tester"  -u c   "critical"   "<b>bold body</b>"
    dunstify -a "dunst tester"         "long body"  "This is a notification with a very long body"
    dunstify -a "dunst tester"         "duplicate"
    dunstify -a "dunst tester"         "duplicate"
    dunstify -a "dunst tester"         "duplicate"
    dunstify -a "dunst tester"         "url"        "www.google.de"

    dunstify -a "dunst tester"         "normal"    "<i>italic body</i>" -I ~/images/modern_2.0.png

    dunstify -a "dunst tester" -u l "Low priority: "
    keypress
}


function progress_bar {
    systemctl --user restart dunst
    dunstify -h int:value:33 -a "dunst tester" -u l "Low priority: "
    dunstify -h int:value:33 -a "dunst tester" -u n "Normal priority: "
    dunstify -h int:value:33 -a "dunst tester" -u c "Critical priority: "
    keypress
}

if [ -n "$1" ]; then
    while [ -n "$1" ]; do
        $1
        shift
    done
else
    basic_notifications
    progress_bar
fi
