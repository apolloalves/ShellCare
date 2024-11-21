#!/bin/bash
################################################################################
# Carbonara                                                                    #
# Script: carbo__EggsInstall.sh 					       #
# Penguins-eggs Installation Script                                            #
# Author: Apollo Alves                                                         #
# Date: 16/12/2023                                                             #
#                                                                              #
# Description:                                                                 #
# This script automates the installation of Penguins-eggs on a Debian-         #
# based system. It performs the following steps:                               #
#  1. Checks if Penguins-eggs is already installed using pacman.               #
#  2. Checks if the Calamares module is already installed.                     #
#  3. Installs Penguins-eggs and/or Calamares if necessary.                    #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

echo -e "\nVerifying Penguins-eggs installation..."
# Check if Penguins-eggs is installed
if pacman -Q penguins-eggs >/dev/null 2>&1; then
   echo -e "\033[1;33mPenguins-eggs is already installed! Skipping installation.\033[0m"
   sleep 2
else
    echo -e "\n\033[01;32mInstalling Penguins-eggs...\033[00;37m\n"
    git clone https://github.com/pieroproietti/get-eggs
    cd get-eggs || exit 1
    sudo ./get-eggs.sh

    # Verify installation
    if ! pacman -Q penguins-eggs >/dev/null 2>&1; then
        echo -e "\033[01;31mError: Penguins-eggs installation failed.\033[00;37m"
        exit 1
    fi
fi

# Check if Calamares module is installed
if pacman -Q calamares-eggs >/dev/null 2>&1; then
    echo -e "\nVerifying Calamares installation..."
   echo -e "\033[1;33mCalamares module is already installed! Skipping installation.\033[0m"

else
    echo -e "\n\033[01;32mInstalling Penguins-eggs Calamares module...\033[00;37m\n"
    eggs calamares --install

    # Verify installation
    if pacman -Q calamares-eggs >/dev/null 2>&1; then
        echo -e "\033[01;32mPenguins-eggs Calamares module installed successfully!\033[00;37m\n"
    else
        echo -e "\033[01;31mError: Calamares module installation failed.\033[00;37m"
        exit 1
    fi
fi

echo -e "\nthere is nothing to do!\n"

