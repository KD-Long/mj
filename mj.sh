#!/bin/bash

# Interval in seconds
INTERVAL=298

# Movement in pixels
MOVE_DISTANCE=1

echo "Starting mj..."

# Infinite loop 
while true; do
  # Save position
  POSITION=$(cliclick p:)
  X=$(echo $POSITION | cut -d, -f1 | cut -d: -f2)
  Y=$(echo $POSITION | cut -d, -f2)

  # move
  cliclick m:$(($X + MOVE_DISTANCE)),$Y
  sleep 0.0001
  cliclick m:$X,$Y

  # Wait for the specified interval
  sleep $INTERVAL
done