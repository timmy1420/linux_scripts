#!/bin/bash

# Note:
# Package needed: intel-gpu-tools
# Tested with version 1.23-1
# Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools

# Important:
# Have a background process running of intel-gpu-tools
# to export the output to a file. Because of that we
# can read the file to manipulate the output to get
# the numeric output.
#
# Example output: 29.94%
#
# intel gpu command:
# command: sudo intel_gpu_top -s 100 | grep Render/3D/0 > gpu_stats
#
# Have fun :)

# Location to the gpu_stats file
path=~/scripts

gpu_stat=$(tail -1 $path/gpu_stats)
emptyString=""
output="${gpu_stat//'Render/3D/0 '/$emptyString}"

# Parse output to string
output=$(echo $output)
parsed=${output::6}

echo $parsed

# Script by timmy1420 | https://github.com/timmy1420
