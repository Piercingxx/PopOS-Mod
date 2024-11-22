#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Installing kitty & setting it up
sudo apt install kitty -y
sudo update-alternatives --config x-terminal-emulator
mkdir $HOME/.config/kitty
cp $HOME/Downloads/i3wm/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# ulauncher install
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update -y
sudo apt install ulauncher -y

# Installing required libraries
sudo apt install libxcb-glx0 libxcb-glx0-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-shape0-dev xcb-proto cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb-composite0-dev python3-xcbgen libxcb-image0-dev libxcb-ewmh-dev libxcb-xrm-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev meson libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-present-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libx11-xcb-dev -y

# Essential Apps
sudo apt install i3 -y
sudo apt install polybar -y
sudo apt install picom -y
sudo apt install feh numlockx fonts-unifont -y
sudo apt install neofetch -y

# Replacing files
mkdir $HOME/.config/i3
cp $HOME/popos-mod/dotconf/i3/config $HOME/.config/i3/config
mkdir $HOME/.config/polybar
mkdir $HOME/.config/picom
cp $HOME/popos-mod/dotconf/polybar/config $HOME/.config/polybar/config
cp $HOME/popos-mod/dotconf/polybar/launch.sh $HOME/.config/polybar/launch.sh
cp $HOME/popos-mod/dotconf/picom/picom.conf $HOME/.config/picom/picom.conf
