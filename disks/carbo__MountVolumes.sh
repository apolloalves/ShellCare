#!/bin/bash
################################################################################
# Script: carbo__MountVolumes.sh                                               #
# Author: Apollo Alves                                                         #
# Date: 21/11/2024                                                             #
################################################################################

# Check if the user is root
if ((EUID != 0)); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m THIS VOLUME IS ON\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

clear_screen() {

    printf "\033c"
}

################################################################################
# MDSATA                                                                       #
################################################################################
printf "\nMount the disk MDSATA (y/n) ? "
read -r MDSATA

if test "y" = "$MDSATA"; then
    echo
    mount -o ro,noatime /dev/sdc3 /mnt/MDSATA/
    print_status
    echo

elif test "n" = "$MDSATA"; then
    umount /dev/sdc3 /mnt/MDSATA/ -l > /dev/null 2>&1
    echo -e '\n\033[00;37m[\033[00;32m THIS VOLUME IS OFF !\033[00;37m ]\033m\n'


elif test "y" || "n" != "$MDSATA"; then
    echo 'invalid arguments!'

fi

################################################################################
# VENTOY                                                                       #
################################################################################

echo -n "Mount the disk VENTOY ? (y/n) "
read -r VENTOY

if test "y" = "$VENTOY"; then
    echo
    mount -o ro,noatime /dev/sdc1 /mnt/VENTOY/
    print_status
    echo

elif test "n" = "$VENTOY"; then
echo
    umount /dev/sdc1 /mnt/VENTOY -l > /dev/null 2>&1
    echo -e '\n\033[00;37m[\033[00;32m THIS VOLUME IS OFF !\033[00;37m ]\033m\n'
    clear_screen

elif test "y" || "n" != "$VENTOY"; then
    echo 'invalid arguments!'

fi
