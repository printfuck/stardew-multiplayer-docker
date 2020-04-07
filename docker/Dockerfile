FROM mono:latest

RUN apt-get update
RUN apt-get install -y wget unzip xvfb x11vnc xterm i3

# Game + ModLoader
RUN mkdir -p /data/Stardew && \
    mkdir -p /data/nexus && \
    wget https://eris.cc/Stardew_latest_1.4.tar.gz -qO /data/latest.tar.gz && \
    tar xf /data/latest.tar.gz -C /data/Stardew && \
    rm /data/latest.tar.gz && \
    wget https://github.com/Pathoschild/SMAPI/releases/download/3.4.1/SMAPI-3.4.1-installer.zip  -qO /data/nexus.zip && \
    unzip /data/nexus.zip -d /data/nexus/ && \
    /bin/bash -c "echo -e \"2\n/data/Stardew/Stardew\ Valley\n1\n\" | /usr/bin/mono /data/nexus/SMAPI\ 3.4.1\ installer/internal/unix-install.exe" 

# Add Mods
COPY mods/alwayson.zip /data/alwayson.zip
COPY mods/unlimitedplayers.zip /data/unlimitedplayers.zip
COPY mods/autoloadgame.zip /data/autoloadgame.zip

RUN unzip /data/alwayson.zip -d /data/Stardew/Stardew\ Valley/Mods && \
    unzip /data/unlimitedplayers.zip -d /data/Stardew/Stardew\ Valley/Mods && \
    unzip /data/autoloadgame.zip -d /data/Stardew/Stardew\ Valley/Mods && \
    rm /data/alwayson.zip /data/unlimitedplayers.zip /data/autoloadgame.zip
RUN chown -R 1010:1010 /data && mkdir -p /home/nya/.config/StardewValley && chown -R 1010:1010 /home/nya/.config/StardewValley/ && chmod +x /data/Stardew/Stardew\ Valley/StardewValley && useradd -m -u 1010 nya
USER nya

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
