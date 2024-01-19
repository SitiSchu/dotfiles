#!/bin/sh

bluetooth_battery() {
    devices_connected=$(bluetoothctl devices Connected | grep Device | cut -d ' ' -f 2)

    if bluetoothctl show | grep -q "Powered: no"; then
        printf '\n'
        exit 1
    else
        if [ -z $devices_connected ]; then
            printf '\n'
            exit 1
        fi
    fi


    for device in $devices_connected; do
        device_battery_percent=$(bluetoothctl info "$device" | grep "Battery Percentage" | awk -F'[()]' '{print $2}')

        if [ -z "$device_battery_percent" ]; then
            bluetoothctl connect $device > /dev/null
            sleep 1
        fi
        
        while [ -z "$device_battery_percent" ]; do
            device_battery_percent=$(bluetoothctl info "$device" | grep "Battery Percentage" | awk -F'[()]' '{print $2}')
            sleep 1
        done

        if [ -n "$device_battery_percent" ]; then
            if [ "$device_battery_percent" -gt 90 ]; then
                device_battery_icon="󰥈"
            elif [ "$device_battery_percent" -gt 80 ]; then
                device_battery_icon="󰥆"
            elif [ "$device_battery_percent" -gt 70 ]; then
                device_battery_icon="󰥅"
            elif [ "$device_battery_percent" -gt 60 ]; then
                device_battery_icon="󰥄"
            elif [ "$device_battery_percent" -gt 50 ]; then
                device_battery_icon="󰥃"
            elif [ "$device_battery_percent" -gt 40 ]; then
                device_battery_icon="󰥂"
            elif [ "$device_battery_percent" -gt 30 ]; then
                device_battery_icon="󰥁"
            elif [ "$device_battery_percent" -gt 20 ]; then
                device_battery_icon="󰥀"
            elif [ "$device_battery_percent" -gt 10 ]; then
                device_battery_icon="󰤿"
            elif [ "$device_battery_percent" -gt 0 ]; then
                device_battery_icon="󰤾"
            fi

            device_output="$device_battery_icon $device_battery_percent%"

            printf " %s" "$device_output"
        fi
    done

    printf ''
}

bluetooth_print() {
    bluetoothctl | grep --line-buffered 'Device\|#' | while read -r REPLY; do
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            
            devices_connected=$(bluetoothctl devices Connected | grep Device | cut -d ' ' -f 2)

            if bluetoothctl show | grep -q "Powered: no"; then
                printf '󰂲'
            else
                if [ -z $devices_connected ]; then
                    printf '󰂯'
                else
                    printf '󰂱'
                fi                
            fi

            counter=0

            for device in $devices_connected; do
                device_info=$(bluetoothctl info "$device")

                device_output=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                if [ $counter -gt 0 ]; then
                    printf ", %s" "$device_output"
                else
                    printf " %s" "$device_output"
                fi

                counter=$((counter + 1))
            done

            printf '\n'
        else
            echo "󰂲"
        fi
    done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on > /dev/null
        sleep 1

        devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" > /dev/null
        done
    else
        devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" > /dev/null
        done

        bluetoothctl power off > /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    --battery)
        bluetooth_battery
        ;;
    *)
        bluetooth_print
        ;;
esac
