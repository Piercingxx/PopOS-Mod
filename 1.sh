#!/bin/bash

# https://github.com/Piercing666

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo su then try again" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

echo "Starting Script 1.sh"
sleep 2

# Checks for active network connection
if [[ -n "$(command -v nmcli)" && "$(nmcli -t -f STATE g)" != connected ]]; then
    awk '{print}' <<< "Network connectivity is required to continue."
    exit
fi

apt install nala -y


# Update packages list and update system
echo "Updating with non-free drivers"
sleep 2
apt update 
apt upgrade -y && echo "Upgrading"
wait

# Making dir
echo "Adding directories"
sleep 2
cd "$builddir" || exit
mkdir -p /home/"$username"/.fonts
mkdir -p /var/lib/usbmux/.config


echo "Install Essentials"
sleep 2
apt full-upgrade -y
wait
sudo apt install -f
wait
nala install kitty -y
wait
nala install dconf* -y
wait
nala install pipx -y
wait
pipx install gnome-extensions-cli --system-site-packages
wait


apt update && upgrade -y
wait
flatpak update -y
wait
apt full-upgrade -y
wait
apt install -f
dpkg --configure -a
echo "After reboot run 2.sh"
sleep 3 && echo "Rebooting"
reboot
