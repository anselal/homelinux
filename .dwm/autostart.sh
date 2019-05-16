#!/bin/bash

compton &
feh --bg-scale ~/.config/wall.jpg

avg_load() {
    #AVG_LOAD=`uptime | awk -F'load averages:' '{ print $2 }'`
    AVG_LOAD=`uptime | awk -F'[a-z]:' '{ print $2 }'`
    echo "L:$AVG_LOAD"
}

dte() {
    echo $(date)
}

battery() {

    BATTERY0=`acpi -V | grep "Battery" | head -n1`
    echo "$BATTERY0" 
}

brand() {
    BRAND=$'\uf30c'
    echo $BRAND
}

while true; do
    xsetroot -name  "$(avg_load) | $(battery) | $(dte) | $(brand)"
    sleep 1
done &
