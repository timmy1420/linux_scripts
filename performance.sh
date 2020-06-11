#!/bin/bash

sudo cpupower frequency-set --max 5GHz
sudo cpupower frequency-set -g performance
sudo cpupower set --perf-bias 0
