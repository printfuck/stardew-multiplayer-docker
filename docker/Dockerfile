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

RUN wget https://github.com/Pathoschild/SMAPI/releases/download/3.9.0/SMAPI-3.9.0-installer.zip -qO /data/nexus.zip && \
    unzip /data/nexus.zip -d /data/nexus/ && \
    /bin/bash -c "echo -e \"2\n/data/Stardew/Stardew\ Valley\n1\n\" | /usr/bin/mono /data/nexus/SMAPI\ 3.9.0\ installer/internal/unix-install.exe" 

RUN apt-get install -y gettext-base jq netcat procps

# Add Mods

# Add Mods & Scripts
COPY ["mods/", "/data/Stardew/Stardew Valley/Mods/"]
COPY scripts/ /opt/

RUN chmod +x /data/Stardew/Stardew\ Valley/StardewValley && \
    chmod -R 777 /data/Stardew/ && \
    chown -R 1000:1000 /data/Stardew && \
    chmod +x /opt/*.sh

RUN \
    APP_ICON_URL=https://stardewcommunitywiki.com/mediawiki/images/4/48/Fiddlehead_Fern.png && \
    install_app_icon.sh "$APP_ICON_URL"

COPY docker-entrypoint.sh /startapp.sh
