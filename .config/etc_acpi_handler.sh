#!/bin/sh
# Default acpi script that takes an entry for all actions

minspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
maxspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
setspeed="/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed"

export XAUTHORITY="/home/pirj/.Xauthority"
export DISPLAY=":0"

set $*

case "$1" in
    button/mute)
        amixer sset Master playback mute
        ;; 
    button/volumeup)
        amixer sset Speaker playback unmute
        amixer sset Master playback unmute 2dB+
        ;; 
    button/volumedown)
        amixer sset Speaker playback unmute
        amixer sset Master playback unmute 2dB-
        ;; 
    video/switchmode)
        VIDEO=`cat /var/tmp/video_out`
        if [[ "$VIDEO" == IN ]]; then
            xrandr --output LVDS --off --output HDMI-0 --mode 1600x1200
            echo "EX" > /var/tmp/video_out
        else
            xrandr --output LVDS --auto --output HDMI-0 --off
            echo "IN" > /var/tmp/video_out
        fi
        ;; 
    button/battery)
        FAN=`cat /var/tmp/fan_mode`
        if [[ "$FAN" == AUTO ]]; then
            echo level 7 > /proc/acpi/ibm/fan
            echo MAX > /var/tmp/fan_mode
        else
            echo level auto > /proc/acpi/ibm/fan
            echo AUTO > /var/tmp/fan_mode
        fi
        ;;
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger "PowerButton pressed: $2"
                poweroff
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                echo -n mem >/sys/power/state
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        echo -n $minspeed >$setspeed
                        #/etc/laptop-mode/laptop-mode start
                        ;;
                    00000001)
                        echo -n $maxspeed >$setspeed
                        #/etc/laptop-mode/laptop-mode stop
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                echo -n mem >/sys/power/state
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
  
# vim:set ts=4 sw=4 ft=sh et:
