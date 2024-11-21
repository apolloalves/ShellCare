#! /bin/bash
##################################################################################
# Carbonara                                                                      #
# Script: carbo__ShowBrootEggs.sh                                                #
# Author: Apollo Alves                                                           #
# Date: 21/11/2024                                                               #
# 										 #
# Description:                                                                   #
# This script is responsible for opening the backup directory located at:        #
# /mnt/VENTOY which contains the list of Penguin's Eggs Files .isos files using  #
# broot as a file manager.                                                       #
##################################################################################

# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

TARGETPATH="/mnt/VENTOY"
echo "Checking device..."
sleep 2
mount /dev/sdd1 $TARGETPATH

echo -e "\nOpening broot...\n"
broot -s -p -d --sort-by-date $TARGETPATH
