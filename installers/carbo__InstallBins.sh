#!/bin/bash
####################################################################################
# Carbonara                                                                        #
# Script: carbo__InstallBins.sh - Carbonara Setup Script                           #
# Author: Apollo Alves                                                             #
# Date: 21/11/2024                                                                 #
#                                                                                  #
# Description:                                                                     #
# This script automates the setup process for Carbonara. It performs               #
# various tasks, including locating the Carbonara folder, setting                  #
# execute permissions, copying executables to /bin, updating the system,           #
# installing dependencies, and configuring system utilities.                       #
#                                                                                  #
# Note: This script assumes a Debian-based system and requires superuser           #
# sudo privileges for certain operations.                                          #
####################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

# Defines the root directory from which find will be run
ROOT_DIR="/home/apollo/carbonara"
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "Carbonara" folder
path=$(find "$ROOT_DIR" -type d -name "carbonara" 2>/dev/null)

# Checks if the folder was found

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'carbonara' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/*/*.sh
    find $path -ls | wc -l

    echo -e "\n\033[01;32msetting execute permissions on shell files...\033[00;37m"
    sleep 2
    sudo chmod +x $path/*/*.sh
    ls -lsht $path/*/*.sh
    echo -e "\n\033[01;32mcopying the executables to the /bin folder...\033[00;37m\n"
    sleep 2

    #echo $path/*/*.sh
    sudo rsync -avh --progress $path/*/*.sh /bin

    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
fi
