# Stardew Valley Multiplayer Docker Compose

This project aims to autostart a Stardew Valley Multiplayer Server as easy as possible.

## Deprecated

*Important*: as I dont have time to maintain this project anymore, I highly recommend to use: 
https://github.com/stardew-valley-dedicated-server/server

## Important

 - Updating to most recent version requires a rebuild: `docker-compose build --no-cache` 
 - Although I'm trying to put out updates, I don't have the time for testing, so I recommend forking and fixing things on your own.
   - You will always get the most recent version with the fork at https://github.com/norimicry/stardew-multiplayer-docker
     
 - Ansible and Terraform will not be supported anymore

## Setup

### Docker-Compose
 
```
git clone https://github.com/printfuck/stardew-multiplayer-docker

docker-compose up
```

## Game Setup

Intially you have to create or load a game once via VNC or Web interface. After that the Autoload Mod jumps into the previously loaded savegame everytime you restart or rebuild the container. The AutoLoad Mod config file is by default mounted as a volume, since it keeps the state of the ongoing SaveGame, but you can also copy your existing SaveGame to the `Saves` volume and define the SaveGame's name in the environment variables.

### VNC

Use a vnc client like `TightVNC` on Windows or plain `vncviewer` on any Linux distribution to connect to the server. You can modify the VNC Port and IP address and Password in the `docker-compose.yml` file like this:

Localhost:
```
   # Server is only reachable on localhost on port 2342...
   ports:
     - 127.0.0.1:2342:5900
   # ... with the password "insecure"
   environment:
     - VNCPASS=insecure
```

### Web Interface 

On port 5800 inside the container is a web interface. This is a bit easier and more accessible than just the VNC interface. Although you will be asked for the vnc password, I wouldn't recommend exposing the port to the outside world.

![img](https://store.eris.cc/uploads/859865e1ab5b23fb223923d9a7e4806b.PNG)

## How it works

The game will be pulled from my servers (I'll assume you already own the game - since you're looking for a multiplayer - so please don't rip it from there) and the modloader (SMAPI) will be pulled from Github when building the container. You can control the mods's settings with environment variables in the `docker-compose.yml` file.

## Used Mods

* [AutoLoadGame](https://www.nexusmods.com/stardewvalley/mods/2509)
* [Always On](https://community.playstarbound.com/threads/updating-mods-for-stardew-valley-1-4.156000/page-20#post-3353880)
* [Unlimited Players](https://www.nexusmods.com/stardewvalley/mods/2213)
* some more ...

## Troubleshooting

### Error Messages in Console

Usually you should be able to ignore any message there. If the game doesn't start or any errors appear, you should look for messages like "cannot open display", which would most likely indicate permission errors.

The error log of the SMAPI Loader can be found inside the container at `/config/xdg/config/StardewValley/ErrorLogs/SMAPI-latest.txt`.

### VNC

Access the game via VNC to initially load or start a pregenerated savegame. You can control the Server from there or edit the config.json files in the configs folder.

### Performance

I'd recomend a VPS/Machine with at least four logical CPUs and 4GB Ram, otherwise there will be horrible lags. The minimum configuration I'd consider playable with two to four players would be two logical CPUs and 1GB of Ram.
https://github.com/stardew-valley-dedicated-server/https://github.com/stardew-valley-dedicated-server/
