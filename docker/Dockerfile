# Pull base image.
FROM jlesage/baseimage-gui:debian-10

# Install xterm.
#RUN add-pkg xterm

# Copy the start script.
#COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="StardewValley"



#FROM mono:latest

RUN apt-get update
#RUN apt-get install -y wget unzip xvfb x11vnc xterm i3
RUN apt-get install -y wget unzip tar

# Game + ModLoader 1.5.4 3.8.3
RUN mkdir -p /data/Stardew && \
    mkdir -p /data/nexus && \
    wget https://eris.cc/Stardew_latest.tar.gz -qO /data/latest.tar.gz && \
    tar xf /data/latest.tar.gz -C /data/Stardew && \
    rm /data/latest.tar.gz 

RUN apt-get install -y mono-complete

RUN wget https://github.com/Pathoschild/SMAPI/releases/download/3.8.3/SMAPI-3.8.3-installer.zip -qO /data/nexus.zip && \
    unzip /data/nexus.zip -d /data/nexus/ && \
    /bin/bash -c "echo -e \"2\n/data/Stardew/Stardew\ Valley\n1\n\" | /usr/bin/mono /data/nexus/SMAPI\ 3.8.3\ installer/internal/unix-install.exe" 

# Add Mods
COPY mods/alwayson.zip /data/alwayson.zip
COPY mods/unlimitedplayers.zip /data/unlimitedplayers.zip
COPY mods/autoloadgame.zip /data/autoloadgame.zip

RUN unzip /data/alwayson.zip -d /data/Stardew/Stardew\ Valley/Mods && \
    unzip /data/unlimitedplayers.zip -d /data/Stardew/Stardew\ Valley/Mods && \
    unzip /data/autoloadgame.zip -d /data/Stardew/Stardew\ Valley/Mods && \
    rm /data/alwayson.zip /data/unlimitedplayers.zip /data/autoloadgame.zip
RUN chmod +x /data/Stardew/Stardew\ Valley/StardewValley && \
    chmod -R 777 /data/Stardew/

COPY docker-entrypoint.sh /startapp.sh
