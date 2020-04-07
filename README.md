# Stardew Valley Multiplayer Docker Compose

This project aims to autostart a Stardew Valley Multiplayer Server as easy as possible.

## Setup

### Docker-Compose
 
```
git clone https://github.com/printfuck/stardew-multiplayer-docker

docker-compose up
```
### Ansible

Create an inventory file with your hosts

```
ansible -i <your_inventori> playbook.yml
```

### Terraform (with Hetzner Cloud)

Enter your API Token in `terraform/vars.auto.tfvars` and  the resource section in `main.tf` run the following script:

```
./terra.sh
```

## Game Setup

Intially you have to create or load a game once after first startup. After that the Autoload Mod jump starts into the previously loaded savegame everytime you rerun the container. You can also edit the config file of the Autoload Mod to archieve similar behaviour.

## How it works

The game, the modloader (SMAPI), and the "Always On" Mod is pulled from my servers (I'll assume you already own the game - since you're looking for a multiplayer - so please don't rip it from there) to minimize version conflicts. Afterwards everything will be unpacked into the right places. The `docker-entrypoint.sh` script will start `Xvfb` and `x11vnc` before starting the game. You can control the game via vnc with the settings within the `docker-compose.yml` file.

## Why Docker

This should be simple and easily deployable, so there are only a few options.

## Used Mods

* [AutoLoadGame](https://www.nexusmods.com/stardewvalley/mods/2509)
* [Always On](https://community.playstarbound.com/threads/updating-mods-for-stardew-valley-1-4.156000/page-20#post-3353880)
* [Unlimited Players](https://www.nexusmods.com/stardewvalley/mods/2213)

## Troubleshooting

### Error Messages in Console

Usually you should be able to ignore any message there. If the game doesn't start or any errors appear, you should look for messages like "cannot open display", which would most likely indicate permission errors.

### VNC

Access the game via VNC to initially load or start a pregenerated savegame. You can control the Server from there or edit the config.json files in the configs folder.


