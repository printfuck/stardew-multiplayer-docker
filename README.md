# Stardew Valley Multiplayer Docker Compose

This project aims to autostart a Stardew Valley Multiplayer Server as easy as possible.

# Setup 
'''
git clone https://github.com/printfuck/stardew-multiplayer-docker

docker-compose up
'''

# How it works

The game, the modloader (SMAPI), and the "Always On" Mod is pulled from my servers to minimize version conflicts. Afterwards everything will be unpacked into the right places. In the end of the init script the game will be started inside '''Xvfb'''.
