#!/bin/bash

# Extract the name of the driver (excluding special characters like └─)
driver=$(lsblk -f | grep btrfs | awk '{print $1}' | sed 's/[^a-zA-Z0-9]//g')

# Check if a driver was found
if [ -z "$driver" ]; then
    echo "No BTRFS partition found. Please enter the driver name:"
    read -r driver
else
    # Prompt the user to confirm the driver
    echo "Found BTRFS partition: $driver. Press Enter to confirm or enter another driver name:"
    read -r input
    # If the user enters something, override the driver with the new input
    if [ -n "$input" ]; then
        driver="$input"
    fi
fi

echo "Selected driver: $driver"
