#!/bin/bash
xbacklight -dec 10
notify-send -h int:value:$(xbacklight) -i gpm-brightness-lcd "LCD"