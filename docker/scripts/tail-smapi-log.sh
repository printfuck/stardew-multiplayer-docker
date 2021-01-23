#!/bin/sh

echo "-- SMAPI Log: Starting"

# Wait for SMAPI log and tail infinitely
while [ ! -f "/config/xdg/config/StardewValley/ErrorLogs/SMAPI-latest.txt" ]; do
  echo "-- SMAPI Log: Waiting for log to appear";
  sleep 5;
done

echo "-- SMAPI Log:  Tailing"
tail -f /config/xdg/config/StardewValley/ErrorLogs/SMAPI-latest.txt
