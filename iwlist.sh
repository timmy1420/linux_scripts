#!/bin/bash

notify-send -t 5000 "iwlist scan" "Refreshing wireless networks..." && gksu iwlist scan
