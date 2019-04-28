#!/bin/bash

# Generate intel_gpu_top output to gpu_stats file

# The timeout command will stop the command after 5 minutes.
# The gpu_stats file will get big because the intel_gpu_top
# command appends the output to the file. We clean up the
# the file by restarting the command by re-initialising 
# the method.

function init() {
	sudo timeout 300 intel_gpu_top -s 100 | grep Render/3D/0 > gpu_stats
	echo "init() has ended"
	init
}

init
