#!/bin/bash

echo "Updating system"
apt-get update -y

echo "Removing unused programs and data..."
apt-get purge -y wolfram-engine bluej greenfoot nodered nuscratch scratch sonic-pi libreoffice* claws-mail claws-mail-i18n minecraft-pi python-pygame geany* realvnc-vnc*

echo "Manually Removing Menu Entries"
rm -R /home/pi/python_games
rm /usr/share/raspi-ui-overrides/applications/python-games.desktop
rm /usr/share/raspi-ui-overrides/applications/debian-reference-common.desktop
rm /usr/share/raspi-ui-overrides/applications/help.desktop
rm /usr/share/raspi-ui-overrides/applications/raspi_resources.desktop
rm /usr/share/raspi-ui-overrides/applications/magpi.desktop
rm /usr/share/raspi-ui-overrides/applications/realvnc-vncaddrbook.desktop
rm /usr/share/raspi-ui-overrides/applications/realvnc-vncviewer.desktop
rm /usr/share/raspi-ui-overrides/applications/debian-reference-common.desktop
rm /usr/share/raspi-ui-overrides/applications/wolfram-language.desktop
rm /usr/share/raspi-ui-overrides/applications/wolfram-mathematica.desktop
rm /usr/share/applications/sense_emu_gui.desktop


echo "Remote Desktop Client: RDesktop"
apt-get install -y rdesktop

echo "Creating Default Connection Desktop Entry"
echo "[Desktop Entry]
Name=Server
Comment=Connessione al server
Icon=/usr/share/pixmaps/gksu-debian.xpm
Exec=bash -c 'rdesktop <ip_address> -u <username> -d <domain> -p <password> -k it -f -z -P -x m'
Type=Application
Encoding=UTF-8
Terminal=false
Categories=None;" > /home/pi/Desktop/rdp.desktop

echo "Fine Tuning RPI Video and Gpu"
echo "arm_freq=1000" >> /boot/config.txt
echo "gpu_mem=256" >> /boot/config.txt

echo "Installing HTOP"
apt-get install -y htop

echo "Cleaning unused Packages"
apt-get autoremove -y

echo "Changing Hostname with current data"
sed -i -e "s/raspberrypi/RaspberryTC.$(date +'%d.%m.%Y')/g" /etc/hosts
echo "RaspberryTC.$(date +'%d.%m.%Y')" > /etc/hostname
/etc/init.d/hostname.sh

echo "Setting IT Keyboard Map"
sed -i -e 's/XKBLAYOUT="gb"/XKBLAYOUT="it"/g' /etc/default/keyboard

echo "Rebooting System"
reboot
