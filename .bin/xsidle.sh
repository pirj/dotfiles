#!/bin/sh
#
# Use xset s $time to control the timeout when this will run.

if [ $# -lt 1 ];
then
  printf "usage: %s cmd\n" "$(basename $0)" 2>&1
  exit 1
fi
cmd="$@"

if [ $(xssstate -s) != "disabled" ];
then
  while true
  do
    tosleep=$(($(xssstate -t) / 1000))
    if [ $tosleep -le 0 ];
    then
      $cmd
      sleep 10
    else
      sleep $tosleep
    fi
  done
fi
