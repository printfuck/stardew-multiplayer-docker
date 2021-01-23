#!/bin/bash
export HOME=/config

for modPath in /data/Stardew/Stardew\ Valley/Mods/*/
do
  mod=$(basename "$modPath")

  # Normalize mod name ot uppercase and only characters, eg. "Always On Server" => ENABLE_ALWAYSONSERVER_MOD
  var="ENABLE_$(echo "${mod^^}" | tr -cd '[A-Z]')_MOD"

  # Remove the mod if it's not enabled
  if [ "${!var}" != "true" ]; then
    echo "Removing ${modPath} (${var}=${!var})"
    rm -rf "$modPath"
    continue
  fi

  if [ -f "${modPath}/config.json.template" ]; then
    echo "Configuring ${modPath}config.json"

    # Seed the config.json only if one isn't manually mounted in (or is empty)
    if [ "$(cat "${modPath}config.json" 2> /dev/null)" == "" ]; then
      envsubst < "${modPath}config.json.template" > "${modPath}config.json"
    fi
  fi
done

# Run extra steps for certain mods
/opt/configure-remotecontrol-mod.sh

/opt/tail-smapi-log.sh &

# Try fixing Backup Permissions
chmod -R 777 /data/Stardew/Stardew\ Valley/save-backups

# Ready to start!
/data/Stardew/Stardew\ Valley/StardewValley

sleep 233
