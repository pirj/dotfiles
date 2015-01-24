#!/bin/sh

FAN=`cat /tmp/fan_mode`
if [[ "$FAN" == AUTO ]]; then
    echo level 7 > /proc/acpi/ibm/fan
    echo MAX > /tmp/fan_mode
else
    echo level auto > /proc/acpi/ibm/fan
    echo AUTO > /tmp/fan_mode
fi
