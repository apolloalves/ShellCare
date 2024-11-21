#!/bin/bash
################################################################################
# Carbonara                                           			       #
# Script: carbo__PipewireRestartAllServices.sh				       #
# Author: Apollo Alves                     				       #
# Date  : 21/11/2024                                                           #
# 									       #
# Description: Script responsible for restarting the services:                 #
# 1. Wireplumber.service 						       #
# 2. pipewire.service							       #
################################################################################

clear
echo "Restarting PipeWire and WirePlumber services..."

systemctl --user restart --now wireplumber.service
systemctl --user restart --now pipewire.service

sleep 5
printf "\nPipeWire and WirePlumber services restarted!\n"

# Checks if the PipewireCheckServices.sh script exists and executes
if [[ -x "$(command -v PipewireCheckServices.sh)" ]]; then
    PipewireCheckServices.sh
else
    echo "PipewireCheckServices.sh not found or not executable"
fi

