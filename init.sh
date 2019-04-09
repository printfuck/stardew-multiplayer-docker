#!/bin/bash

if [ ! -d /data/Stardew ]; then

  echo "Downloading Game"
  mkdir -p /data/Stardew
  mkdir -p /data/nexus
  wget https://eris.cc/Stardew_latest.tar -O /data/latest.tar

  echo "Unpacking"
  tar xvf /data/latest.tar -C /data/Stardew

  echo "Downloading Modloader"
  wget https://github.com/Pathoschild/SMAPI/releases/download/2.11.1/SMAPI-2.11.1-installer.zip -O nexus.zip

  echo "Unpacking Modloader"
  unzip nexus.zip -d /data/nexus/

  echo "Installing Modloader"
  /bin/bash -c "echo -e \"2\n/data/Stardew/Stardew\ Valley\n1\n\" | /usr/bin/mono /data/nexus/SMAPI\ 2.11.1\ installer/internal/unix-install.exe"
  
  echo "Downloading Always On Mod"
  wget https://eris.cc/always.zip -O /data/always.zip
  unzip /data/always.zip -d /data/Stardew/Stardew\ Valley/Mods
fi

apt-get install -y xterm i3

Xvfb :10 -screen 0 1000x1000x24 -ac &
export DISPLAY=:10.0
x11vnc -display :10 -forever -shared -loop &
i3 &
TERM=xterm
/data/Stardew/Stardew\ Valley/StardewValley
