#!/bin/bash

cd ~/Desktop
mkdir usb && cd usb

gksu mount /dev/sdb1 usb
