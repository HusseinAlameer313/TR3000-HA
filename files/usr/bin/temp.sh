#!/bin/sh
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
echo "CPU Temp: $((TEMP/1000))°C"
