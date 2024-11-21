#!/bin/bash
################################################################################
# Carbonara                                                                    #
# Script: carbo__ClonraidBackups.sh                                            #
# Author: Apollo Alves                                                         #
# Date  : 21/11/2024                                                           #
#									       #
# Description:                                                                 #
# This script opens Nautilus file manager to access a specific directory.      #
# It provides feedback indicating whether  				       #
# the operation was successful.                                                #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

MENU='/bin/carbo__MenuItem.sh'

echo -e "\nOpening Nautilus..."
sleep 1

nautilus /mnt/MDSATA >/dev/null 2>&1
$MENU
