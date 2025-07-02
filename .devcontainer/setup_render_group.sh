#!/bin/bash

set -e

echo "Running Script to Add User to 'render' and 'video' Groups (GPU support)"
echo " + NO-GPU Intel rendering (needs validation)"

# Get the current username
USERNAME=$(id -un)
echo "Current user: $USERNAME"

# Find the first render device under /dev/dri/
RENDER_DEVICE=$(find /dev/dri/ -name 'renderD*' | head -n 1)

if [ -n "$RENDER_DEVICE" ]; then
  HOST_RENDER_GID=$(stat -c '%g' "$RENDER_DEVICE")
  echo "Using render device: $RENDER_DEVICE with GID: $HOST_RENDER_GID"

  # Create or modify the render group inside the container
  if ! getent group render >/dev/null; then
    sudo groupadd -g "$HOST_RENDER_GID" render
  else
    sudo groupmod -g "$HOST_RENDER_GID" render || true
  fi

  # Add the current user to the render group
  sudo usermod -aG render "$USERNAME"
else
  echo "No render devices found in /dev/dri/"
fi

# Find the first video device under /dev/dri/
VIDEO_DEVICE=$(find /dev/dri/ -name 'card*' | head -n 1)

if [ -n "$VIDEO_DEVICE" ]; then
  HOST_VIDEO_GID=$(stat -c '%g' "$VIDEO_DEVICE")
  echo "Using video device: $VIDEO_DEVICE with GID: $HOST_VIDEO_GID"

  # Create or modify the video group inside the container
  if ! getent group video >/dev/null; then
    sudo groupadd -g "$HOST_VIDEO_GID" video
  else
    sudo groupmod -g "$HOST_VIDEO_GID" video || true
  fi

  # Add the current user to the video group
  sudo usermod -aG video "$USERNAME"
else
  echo "No video devices found in /dev/dri/"
fi

# Execute the original command if any
exec "$@"
