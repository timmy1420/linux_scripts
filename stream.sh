#!/bin/bash

# Stream audio over HTTP using vlc background process.

gksu ufw disable
notify-send -t 20000 "HTTP stream link" "{ip-address:8888/pc.mp3}"
notify-send -t 10000 "Ufw status" "Firewall disabled for now"

cvlc -vvv pulse://alsa_output.pci-0000_00_1b.0.analog-stereo.equalizer.monitor --sout '#transcode{acodec=mp3,ab=128,channels=2}:standard{access=http,dst=0.0.0.0:8888/pc.mp3}'
# cvlc -vvv pulse://alsa_output.pci-0000_00_1b.0.analog-stereo.monitor --audio-filter 'gain' --sout '#transcode{acodec=mp3,ab=128,channels=2}:standard{access=http,dst=0.0.0.0:8888/pc.mp3}'

gksu ufw enable
notify-send -t 10000 "Ufw status" "Firewall enabled"
