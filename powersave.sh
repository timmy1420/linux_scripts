#!/bin/bash

sudo cpupower frequency-set --max 800MHz
sudo cpupower frequency-set -g powersave
sudo cpupower set --perf-bias 15
