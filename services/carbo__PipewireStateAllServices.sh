#!/bin/bash
################################################################################
# Carbonara                                           			       #
# Script: carbo__PipewireStateAllServices.sh			               #
# Author : Apollo Alves                     				       #
# Date : 21/11/2024                                                            #
# 									       #
# Description: Script responsible for listing the status of all PipeWire       #
# services                              			               #
################################################################################

# Check all services of pipewire user section
#
echo
systemctl --user list-unit-files --state=enabled
echo

systemctl --user status custom-pipewire.service
echo

systemctl --user status pipewire.service
echo
systemctl --user status pipewire-pulse.service
echo
systemctl --user status wireplumber.service



