#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
##############################################################################################
#                                                                                            #
# Script: eggs__install.sh - Penguins-eggs Installation Script                               #
#                                                                                            #
# Author: Apollo Alves                                                                       #
# Date: 16/12/2023                                                                           #
#                                                                                            #
# Description:                                                                               #
# This script automates the installation of Penguins-eggs on a Debian-                       #
# based system. It performs the following steps:                                             #
#                                                                                            #
# 1. Checks if Penguins-eggs is already installed.                                           #
# 2. Downloads the Penguins-eggs package if not present.                                     #
# 3. Installs the Penguins-eggs package using dpkg.                                          #
# 4. Marks the installed package to prevent automatic updates.                               #
# 5. Installs Penguins-eggs Calamares module.                                                #
# 6. Removes the downloaded .deb file.                                                       #
#                                                                                            #
# Note: This script assumes a Debian-based system and requires superuser                     #
#                                                                                            #
##############################################################################################

echo -e "\n\033[01;32mVerifying Penguins-eggs installation...\033[00;37m\n"

# Install the package
pacman -Syu --noconfirm
# Download the Penguins-eggs package
echo -e "\n\033[01;32minstalling Penguins-eggs calamares...\033[00;37m\n"
git clone https://github.com/pieroproietti/get-eggs
cd get-eggs && sudo ./get-eggs.sh
eggs calamares --install
echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

# BLINK MESSAGE
echo -e "\n\033[01;05;37mPenguins-eggs installed successfully!!\033[00;37m\n"
sleep 5



