#!/bin/bash
################################################################################
# carbonara                                                                    #
# Script: carbo__PacmanCleanCache.sh 					       #
# Author: Apollo Alves                                                         #
# Date  : 21/11/2024                                                           #
# 							  		       #
# Description     							       #
# optimizer performance.                                                       #
# Remove It removes:   							       #
  # cache and log files                 				       #
  # cleans the system 							       #
  # removes orphaned libraries 						       #
  # clears the rubbish bin, and           				       #
  # Requires root privileges to run.                                           #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}


# YELLOW MESSAGE
################################################################################
echo -e "\n\033[1;33mRemoving cache and logs files system...\033[0m"
################################################################################

sleep 2
rm -rfv /var/lib/apt/lists/lock
rm -rfv /var/lib/dpkg/lock-frontend
rm -rfv /var/lib/apt/lists/*
rm -rfv ~/.cache/thumbnails/*
rm -rfv ~/.cache/thumbnails/normal/*
rm -rf ~/.cache/icon*
rm -rfv /var/cache/apt/archives/lock
rm -rfv ~/.cache/tracker/
rm -Rfv /var/log/*
find /var/log/ ! -name 'syslog' -type f -exec rm -fv {} +

# OK MESSAGE
print_status

# YELLOW MESSAGE
################################################################################
echo -e "\n\033[1;33mCleaning files system...\033[0m"
################################################################################

pacman -Scc --noconfirm

# OK MESSAGE
print_status


# YELLOW MESSAGE
################################################################################
echo -e "\n\033[1;33mRemoving Rubbish Bin files...\033[0m"
################################################################################

rm -rfv .local/share/Trash/*
rm -rfv /home/*/.local/share/Trash/*/**
rm -rfv /root/.local/share/Trash/*/**
rm -rfv ~/.local/share/Trash/*i
rm -rfv /home/*/.local/share/recently-used.xbel
sudo journalctl --vacuum-size=50M
# history -c && history -w

# OK MESSAGE
print_status


