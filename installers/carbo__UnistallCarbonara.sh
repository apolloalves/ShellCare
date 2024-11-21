#!/bin/bash

################################################################################
# Carbonara                                                                    #
# Script: carbo__UnistallCarbonara.sh                                          #
# Author: Apollo Alves                                                         #
# Date  : 21/11/2024                                                           #
#                                                                              #
# Description:                                                                 #
# Script responsible for removing all Carbonara related scripts from the       #
# usr/bin folder.                                                              #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'
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
