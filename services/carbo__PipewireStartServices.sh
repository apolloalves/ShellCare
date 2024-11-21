#!/bin/bash
################################################################################
# Carbonara                                           			       #
# Script: carbo__PipewireStartServices.sh			               #
# Author: Apollo Alves                     				       #
# Date  : 21/11/2024                                                           #
# 									       #
# Description: Script responsible for enabling and starting all PipeWire       #
# services:                              				       #
# 1. pipewire.service 						               #
# 2. pipewire-pulse.service						       #
# 3. wireplumber.service 						       #
# 4. pipewire.service 							       #
################################################################################

systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service
systemctl --user restart pipewire.service pipewire-pulse.service wireplumber.service

