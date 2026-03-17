#!/bin/sh

if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    echo "CPU Temp: $((TEMP/1000))°C"
else
    echo "Temp sensor not found"
fi
