#!/bin/bash

# Scripts to specify CPU governor speed. Use wisely :)

#Get user input

echo "Select CPU frequency:"
echo "1. 1.20 GHz"
echo "2. 1.33 GHz"
echo "3. 1.47 GHz"
echo "4. 1.60 GHz"
echo "5. 1.73 GHz"
echo "6. 1.87 GHz"
echo "7. 2.00 GHz"

read frequency
case $frequency in
  1) frequency=1.20GHz;;
  2) frequency=1.33GHz;;
  3) frequency=1.47GHz;;
  4) frequency=1.60GHz;;
  5) frequency=1.73GHz;;
  6) frequency=1.87GHz;;
  7) frequency=2.00GHz;;
esac

sudo cpupower frequency-set -f $frequency
