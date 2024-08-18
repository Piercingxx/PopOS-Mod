#!/bin/bash

# https://github.com/Piercing666

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo su then try again" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

echo "Starting Script 2.sh"
sleep 2

# Checks for active network connection
if [[ -n "$(command -v nmcli)" && "$(nmcli -t -f STATE g)" != connected ]]; then
  awk '{print}' <<<"Network connectivity is required to continue."
  exit
fi

echo "Updating Repositiories"
sleep 2
sudo apt update && upgrade -y
wait


# Making .config and.fonts Directories
cd "$builddir" || exit
mkdir -p /home/"$username"/.config
chown -R "$username":"$username" /home/"$username"/.config
mkdir -p /home/"$username"/.fonts
chown -R "$username":"$username" /home/"$username"/.fonts
mkdir -p /home/"$username"/.local/share/gnome-shell/extensions/
chown -R "$username":"$username" /home/"$username"/.local/share/gnome-shell/extensions/
mkdir -p /root/.icons
chown -R root:root /root/.icons
mkdir -p /home/"$username"/Pictures/backgrounds
chown -R "$username":"$username" /home/"$username"/Pictures/backgrounds
cp -R dotconf/kitty /home/"$username"/.config/
chown -R "$username":"$username" /home/"$username"/.config/kitty


# Installing important things && stuff && some dependancies
echo "Installing Programs and Drivers"
sleep 2
apt install kitty -y
apt install gnome-terminal -y
apt install gnome-text-editor -y
apt install dconf* -y
apt install pipx -y
apt install dbus-x11 -y
apt install cups -y
apt install util-linux -y
apt install xdg-utils -y
apt install libnvidia-egl-wayland -y
apt install build-essential -y
apt install gnome-tweaks -y
apt install nautilus -y
apt install gnome-shell-extension-manager -y
apt install gdebi -y
apt install fuse -y
apt install libfuse2 -y
apt install x11-xserver-utils -y
apt install devscripts -y
apt install papirus-icon-theme -y
apt install fonts-noto-color-emoji -y
apt install zip unzip gzip tar -y
apt install make -y
apt install linux-headers-generic -y
apt install seahorse -y
apt install gnome-calculator -y
apt install rename -y
apt install neofetch -y
apt install mpv -y
apt install gparted -y
apt install curl -y
apt install gh -y
apt install lua5.4 -y
apt install gnome-disk-utility -y
sleep 2
flatpak install https://flathub.org/beta-repo/appstream/org.gimp.GIMP.flatpakref -y
flatpak install flathub com.google.Chrome -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.dropbox.Client -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub org.gnome.SimpleScan -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub com.usebottles.bottles -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub org.qbittorrent.qBittorrent -y
flatpak install flathub io.missioncenter.MissionCenter -y
flatpak install flathub com.tomjwatson.Emote -y
sleep 2

# Gimp Config
rm -r /home/"username"/.var/app/org.gimp.GIMP/config/GIMP/2.99
cd dotconf/Gimp || exit
cd "$builddir" || exit

# VSCode
wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/e170252f762678dec6ca2cc69aba1570769a5d39/code_1.88.1-1712771838_amd64.deb"
wait
dpkg -i code_1.88.1-1712771838_amd64.deb
wait
rm code_1.88.1-1712771838_amd64.deb

# Synology Drive
wget "https://global.download.synology.com/download/Utility/SynologyDriveClient/3.4.0-15724/Ubuntu/Installer/synology-drive-client-15724.x86_64.deb"
wait
sudo dpkg -i synology-drive-client-15724.x86_64.deb
wait

# Synology Chat
wget "https://global.synologydownload.com/download/Utility/ChatClient/1.2.2-0222/Ubuntu/x86_64/Synology%20Chat%20Client-1.2.2-0222.deb"
wait
sudo dpkg --force-all -i Synology\ Chat\ Client-1.2.2-0222.deb
wait


sudo apt update
wait
sudo apt upgrade -y
wait


echo "Installing Cursors & Icons"
sleep 2
# Cursor
wget -cO- https://github.com/phisch/phinger-cursors/releases/latest/download/phinger-cursors-variants.tar.bz2 | tar xfj - -C ~/.icons

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors || exit
./install.sh
cd "$builddir" || exit
rm -rf Nordzy-cursors


echo "Installing Fonts"
sleep 2
# Installing fonts
cd "$builddir" || exit
apt install fonts-font-awesome fonts-noto-color-emoji -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
chmod -R 777 FiraCode.zip
unzip FiraCode.zip -d /home/"$username"/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
chmod -R 777 Meslo.zip
unzip Meslo.zip -d /home/"$username"/.fonts
mv dotfonts/fontawesome/otfs/*.otf /home/"$username"/.fonts/
chown -R "$username":"$username" /home/"$username"/.fonts
apt install ttf-mscorefonts-installer -y
apt install fonts-terminus -y

# Reloading Font
fc-cache -vf
wait


# partial Gnome Extensions - the rest are ran in 3.sh
apt install gnome-shell-extension-appindicator -y
apt install gnome-shell-extension-gsconnect -y
apt install gnome-shell-extension-caffeine -y


#Nautilus Customization
apt install gnome-sushi -y
apt install imagemagick nautilus-image-converter -y
apt install nautilus-admin -y
apt install gir1.2-gtk-4.0 -y
git clone https://github.com/Stunkymonkey/nautilus-open-any-terminal.git
cd nautilus-open-any-terminal || exit
make
sudo make install schema
glib-compile-schemas /usr/share/glib-2.0/schemas
cd "$builddir" || exit
rm -rf nautilus-open-any-terminal


# Removing zip files and stuff
rm -r dotconf
rm -rf FiraCode.zip
rm -rf Meslo.zip


sudo apt update && upgrade -y
wait
apt full-upgrade -y
wait
apt install -f
wait
dpkg --configure -a
apt install --fix-broken
wait
apt autoremove -y
sudo apt update && upgrade -y
wait
flatpak update -y



# Beautiful bash
git clone https://github.com/ChrisTitusTech/mybash
chown -R "$username":"$username" /home/"$username"/.bashrc
cd mybash || exit
bash setup.sh
cd "$builddir" || exit
rm /home/"$username"/.bashrc
cp dotconf/.bashrc /home/"$username"/.bashrc
chown -R "$username":"$username" /home/"$username"/.bashrc



read -r -p "2.sh complete. Reboot and install Steam. Then run Script 3.sh for Nvidia drivers, skip 3.sh if you are not using Nvidia hardware. Press enter to reboot"
sudo reboot
