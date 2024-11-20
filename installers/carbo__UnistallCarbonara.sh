#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
####################################################################################
#                                                                                  #
# Script: install.sh - LinuxBashCare Setup Script                                  #
#                                                                                  #
# Author: Apollo Alves                                                             #
# Date: 16/12/2023                                                                 #
#                                                                                  #
# Description:                                                                     #
# This script automates the setup process for LinuxBashCare. It performs           #
# various tasks, including locating the LinuxBashCare folder, setting              #
# execute permissions, copying executables to /bin, updating the system,           #
# installing dependencies, and configuring system utilities.                       #
#                                                                                  #
# Note: This script assumes a Debian-based system and requires superuser           #
# (sudo) privileges for certain operations.                                        #
#                                                                                  #
####################################################################################
clear
# Defines the root directory from which find will be run
ROOT_DIR="/"
BIN='/usr/bin/carbo__*'
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "carbonara" folder
path=$(find "$ROOT_DIR" -type d -name "carbonara" 2>/dev/null)
rm -rfv /home/apollo/Projects/.gnome-builder/projects/carbonara 2>/dev/null
# Checks if the folder was found



# Checks if the folder was found
if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'Carbonara' folder was found in: $path\033[00;37m\n"

    ls -lsht $path
    echo
    echo "Lozalizado pastas"
    find $path/ -ls | wc -l

    echo "Lozalizado executaveis"
    find $path/*/*.sh -ls | wc -l
    echo
    echo
    ls -lsht $path/*/*.sh
    rm -rfv $path
    rm -rfv $BIN
    rm -rfv $BIN/carbonara.sh
fi
 echo "Thank you!"
    sleep 2 
    echo "bye!"

    exit

fi
i
