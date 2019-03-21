#!/bin/bash

notify-send -t 10000 "Temperature monitoring" "Status: Active"

function init() {
  temp=$(sudo cat /proc/acpi/ibm/thermal | grep 'temperatures:')
  emptyString=""
  output="${temp//temperatures:	/$emptyString}"
  output="${output// 0 0 0 0 0 0 0/$emptyString}"
  currentTemp=$output

  if [ $currentTemp -lt 88 ]
  then
    sudo cpupower frequency-set -g ondemand
  elif [ $currentTemp -lt 92 ]
  then
    sudo cpupower frequency-set -f 1.87GHz
  else
    sudo cpupower frequency-set -g powersave
  fi

  # Wait 7 seconds
  sleep 7
  init
}

init
