#!/bin/bash
xbacklight -inc 10
# notify-send -h int:value:$(xbacklight) -i gpm-brightness-lcd "LCD"

NID=0

for i in {0..100..10}
    do
          NID=$(notify-send $NID $i -h int:value:$(xbacklight) -i gpm-brightness-lcd "LCD")
          sleep 0.5
    done