#!/bin/bash
################################################################################
# Script: carbo__OptimizePerformance.sh                                        #
# Author: Apollo Alves                                                 	       #
# Date  : 21/11/2024                                                  	       #
#                                                                              #
# Optimize Performance Script                                                  #
# This script is designed to optimize the performance of a GNU/Linux system.   #
# It includes operations such as clearing page cache, executing prelink        #
# for shared library optimization, cleaning RAM memory, and handling swap.     #
# Ensure it is run with root privileges.                                       #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

SWAPPINESS=$(cat /proc/sys/vm/swappiness)
LINE_SCRIPT='carbo__LineScript.sh'

# Function to print status
print_status() {

    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

# Clear page cache
echo -e "\n\033[01;32mRemoving caches...\033[00;37m\n"
sudo pacman -Scc --noconfirm
print_status

#RAM MEMORY
echo -e "\n\033[01;32mCleaning Swap...\033[00;37m\n"
carbo__CleanupSwap.sh

echo -e "\n\033[01;05;37mSystem successfully optimized!!\033[00;37m\n"


