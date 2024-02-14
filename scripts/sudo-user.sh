#!/bin/bash

{
# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Prompt for the username
echo "Enter the username:"
read username

# Create the user
useradd -m $username

# Set the password for the user
passwd $username

# Add the user to the 'wheel' group for sudo privileges
usermod -aG wheel $username

echo "User $username created and added to sudoers."

}
