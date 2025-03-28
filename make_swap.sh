#!/bin/bash

gksu fallocate -l 15G ~/.mount/swapfile;
gksu chmod 600 ~/.mount/swapfile;
gksu mkswap ~/.mount/swapfile;
gksu swapon ~/.mount/swapfile;

/swapfile    none    swap    sw    0   0