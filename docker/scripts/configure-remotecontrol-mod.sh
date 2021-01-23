#!/bin/sh

# Quit if we don't have any default admins
if [ -z "${REMOTE_CONTROL_DEFAULT_ADMINS}" ] || [ ! -f "/data/Stardew/Stardew Valley/Mods/RemoteControl/config.json" ]; then
    return
fi

# Add default admins to the admin list
jq ".admins[.admins | length] |= . + ${REMOTE_CONTROL_DEFAULT_ADMINS}" "/data/Stardew/Stardew Valley/Mods/RemoteControl/config.json" > "/data/Stardew/Stardew Valley/Mods/RemoteControl/config.json.out"
mv -f "/data/Stardew/Stardew Valley/Mods/RemoteControl/config.json.out" "/data/Stardew/Stardew Valley/Mods/RemoteControl/config.json"
