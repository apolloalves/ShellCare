#!/bin/bash
################################################################################
# Carbonara                                                                    #
# Script: carbo__verifyRoot.sh                                                 #
# Author: Apollo Alves                                                         #
# Date  : 21/11/2024                                                           #
# Description: Script responsible for checking if the user is root             #
################################################################################

if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi