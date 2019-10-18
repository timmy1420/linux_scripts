#!/bin/bash

# First start Teamviewer daemon
teamviewer --daemon start

# Then launch Teamviewer GUI
#/opt/teamviewer/tv_bin/script/teamviewer
teamviewer

# When teamviewer is closing, stop daemon
teamviewer --daemon stop
