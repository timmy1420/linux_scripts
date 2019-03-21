#!/bin/bash

# Get PID of plank
plankPID=$(pidof plank)

# Kill plank by PID (Process ID)
kill $plankPID

# Start Plank again
plank

# Script written by timmy1420 for Arch Linux :)
