#!/bin/bash
# Check if the user is root
source 'carbo__verifyRoot.sh'
################################################################################
# Carbonara                                                                    #
# Script: carbo__RubbishBin.sh                                                 #
# Author: Apollo Alves                                                         #
# Date  : 21/11/2024                                                           #
#                                                                              #
# Description: Rubbish Bin Script                                              #
# This script is designed to be run with root privileges and removes           #
# rubbish bin files and clears recently-used.xbel in the home                  #
# directory. It utilizes commands to remove specific files related to          #
# the rubbish bin and close any active Nautilus instances.                     #
################################################################################

MENU='/bin/carbonara.sh'

pkill nautilus
echo "nautilus is closed!"
trash-empty --all -f
echo "The trash was cleanup!"

rm -rf  /home/*/.local/share/recently-used.xbel
rm -rf ~/.local/share/Trash/*i >/dev/null

echo "Rubish bin is clean!"
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
sleep 2
read -rsn1 -p "Press any key to continue..."
clear
$MENU
