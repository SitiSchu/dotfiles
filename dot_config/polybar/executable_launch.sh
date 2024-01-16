#!/usr/bin/env bash

LOG_DIR="$HOME/.local/share/polybar"
mkdir $LOG_DIR -p

# Close all running bars
polybar-msg cmd quit >/dev/null 2>&1
#killall -9 polybar

create_bar () {
	LOG_FILE=$LOG_DIR/$2_$1.log
	date -Iseconds >> $LOG_FILE
  	MONITOR=$1 polybar $2 >>$LOG_FILE 2>&1  & disown
}

PRIMARY_MONITOR=$(polybar --list-monitors | grep "primary" | cut -d":" -f1)
OTHER_MONITORS=$(polybar --list-monitors | grep -v "primary" | cut -d":" -f1)

create_bar $PRIMARY_MONITOR "main"

for m in $OTHER_MONITORS; do
	create_bar $m "side"
done

