#!/bin/bash
################################################################################
# Carbonara                                           			       #
# Script: carbo__RestartGDMService.sh			                       #
# Author: Apollo Alves                     				       #
# Date  : 21/11/2024                                                           #
# 									       #
# Description							               #
# Description: Script responsible for restarting the gdm.service service       #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

echo -e "\n\033[01;32mRestating gdm3...\033[00;37m\n"
sleep 2
systemctl restart gdm.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"