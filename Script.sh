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


echo "Installing Remmina"
apt-get install -y remmina remmina-plugin-rdp

echo "Installing HTOP"
apt-get install -y htop

echo "Cleaning unused Packages"
apt-get autoremove -y

echo "Changing Hostname with current data"
hostname "RaspberryTC.$(date +'%d.%m.%Y')"

echo "Setting IT Keyboard"
setxkbmap it


echo "Rebooting System"
reboot
