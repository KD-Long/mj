#!/bin/bash

### Requires: brew install cliclick

# Interval in seconds
INTERVAL=270

# Movement in pixels
MOVE_DISTANCE=1

# Function to get the current position
get_position() {
  POSITION=$(cliclick p:)
  X=$(echo $POSITION | cut -d, -f1 | cut -d: -f2)
  Y=$(echo $POSITION | cut -d, -f2)
}

# Get initial  position
get_position
LAST_X=$X
LAST_Y=$Y

echo "Starting mj..."

# Infinite loop 
while true; do
  # Wait for the inactivity interval
  sleep $INTERVAL
  
  # Get the current  position
  get_position
  
  # Check if moved since the last check
  if [[ "$X" == "$LAST_X" && "$Y" == "$LAST_Y" ]]; then
    cliclick m:$(($X + MOVE_DISTANCE)),$Y
    sleep 0.001
    cliclick m:$X,$Y
  fi

  # Update last known position
  LAST_X=$X
  LAST_Y=$Y
done