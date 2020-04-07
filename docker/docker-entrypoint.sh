#!/bin/bash

Xvfb :10 -screen 0 1580x920x24 -ac &
export DISPLAY=:10.0
x11vnc -display :10 -rfbport 5900 -rfbportv6 -1 -no6 -noipv6 -httpportv6 -1 -forever -desktop StardewValley -cursor arrow -shared -passwd 23eris42 & 
sleep 5
i3 &
chmod +x /data/Stardew/Stardew\ Valley/StardewValley

TERM=xterm
/data/Stardew/Stardew\ Valley/StardewValley
