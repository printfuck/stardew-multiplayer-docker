FROM mono:latest

RUN mkdir -p /data/Stardew
RUN mkdir -p /data/nexus

RUN apt-get update
RUN apt-get install -y wget unzip xvfb x11vnc xterm i3

CMD /data/Stardew/Stardew\ Valley/StardewValley
