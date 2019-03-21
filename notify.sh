#!/bin/bash

# Script to show notification with boot time
boot_time=$(systemd-analyze)
total_pkgs=$(pacman -Q | wc -l)
sleep 24
notify-send -t 10000 "Systemd-analyze" "$boot_time"
sleep 3
notify-send -t 10000 "Total installed packages" "$total_pkgs installed"

# Developed by timmy1420 - MANJARO XFCE 16.10.1 (1) and Arch Linux (2)
