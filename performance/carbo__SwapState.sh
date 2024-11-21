
#!/bin/bash
################################################################################
# Carbonara                                                                    #
# Script: carbo__SwapState.sh                                                  #
# Author: Apollo Alves                                                         #
# Date  : 21/12/2024                                                           #
#                                                                              #
# Description : This shell script called "swap__state.sh" displays the state   #
# of the system's swap memory. Here is a summary of what # it does:            #                                                                                                             #
# 									       #	                                                                                                                                #
# 1. Displays a message indicating that the state of swap memory will          #
#    be shown.                                                                 #
# 2. Use the "free -h" command to display information about memory usage,      #
#    including swap memory.                                                    #
# 3. Displays a LINE_SCRIPT using the "$LINE_SCRIPT" variable, which prints    #
#    a LINE_SCRIPT for each executed command.                                  #
# 4. Displays a message indicating that the operation is complete.             #
# 5. Wait 2 seconds.                                                           #
#                                                                              #
# In short, the script displays information about the system's swap memory     #
# usage, providing a view of the current                                       #
# state of memory. This can be useful for monitoring memory usage and          #
# identifying whether swap memory is being used by the system.                 #
################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'
source carbo__PerformanceWizard.sh
echo -e "\nSwap Sate\n"
free -h
carbo__LineScript.sh
echo -e "\n\033[01;37m[\033[00;32m done\033[00;37m ]\033m\n"

