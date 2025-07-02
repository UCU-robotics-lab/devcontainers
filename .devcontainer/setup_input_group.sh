#!/bin/bash

set -e
echo "Running Script to Add User to "input" Group (Logitech controller) support"

# -----------------------------
# Script to Add User to "input" Group
# -----------------------------

# Explanation:
# Required to allow the container to access the host's input devices (e.g., joystick, gamepad, etc.)
# With this we can use the native gamepad for support in simulation.


# Get the current username
USERNAME=$(id -un)
echo "Current user: $USERNAME"

# Find the first joystick device under /dev/input/ (e.g., js0)
INPUT_DEVICE=$(find /dev/input/ -name 'js*' | head -n 1)

if [ -n "$INPUT_DEVICE" ]; then
  HOST_INPUT_GID=$(stat -c '%g' "$INPUT_DEVICE")
  echo "Using input device: $INPUT_DEVICE with GID: $HOST_INPUT_GID"

  # Check if the 'input' group exists
  if ! getent group input >/dev/null; then
    # Create the 'input' group with the host's GID
    sudo groupadd -g "$HOST_INPUT_GID" input
    echo "Created 'input' group with GID $HOST_INPUT_GID"
  else
    # Modify the existing 'input' group to match the host's GID
    sudo groupmod -g "$HOST_INPUT_GID" input || true
    echo "Modified 'input' group to GID $HOST_INPUT_GID"
  fi

  # Add the current user to the 'input' group
  sudo usermod -aG input "$USERNAME"
  echo "Added user '$USERNAME' to 'input' group"
else
  echo "No input devices found in /dev/input/"
fi

# Execute the original command if any
exec "$@"

echo "echo \"Setting Logitech controller to work inside Docker:\"" >> ~/.bashrc
echo 'export SDL_VIDEODRIVER=dummy' >> ~/.bashrc
echo 'export SDL_AUDIODRIVER=dummy' >> ~/.bashrc
echo 'export SDL_JOYSTICK_DEVICE=/dev/input/js0' >> ~/.bashrc
echo 'export SDL_JOYSTICK_DISABLE_UDEV=1' >> ~/.bashrc

