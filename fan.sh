#!/bin/bash

# Script to specify fan speed. Use very wisely :)

#Get user input

echo "Select fan speeld level (0-7, auto, full-speed):"
echo "0.          ~0 rpm"
echo "1.          ~1998 rpm"
echo "2.          ~3971 rpm"
echo "3/4.        ~4219 rpm"
echo "5.          ~4527 rpm"
echo "6.          ~4549 rpm"
echo "7.          ~5219 rpm"
echo "auto.       ~rpm"
echo "full-speed. ~7265 rpm => *** DANGEROUS!!! ***"
echo ""

echo "Level: "
read level

echo level $level | sudo tee /proc/acpi/ibm/fan
