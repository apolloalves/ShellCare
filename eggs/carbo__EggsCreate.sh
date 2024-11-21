#!/bin/bash
################################################################################
# Carbonara                                                                    #
# Script : carbo__EggsCreate.sh                                                #
# Created: 16/12/2023                                                          #
# Author : Apollo Alves                                                        #
################################################################################                                                                                                                      #

# Check if the user is root
source 'carbo__verifyRoot.sh'


EGGS_DIRECTORY="/home/eggs"
FILEPATH="/home/eggs/.mnt/"
MDSATA="/mnt/MDSATA/ARCHEGGS"
VENTOY="/mnt/VENTOY"
LINE_SCRIPT='/bin/carbo__LineScript.sh'

# Check and mount devices
echo -e "\nChecking devices..."
sleep 2


# Check and mount devices
echo -e "\nChecking devices..."
sleep 1

if ! mountpoint -q $VENTOY; then
    mount /dev/sdd1 $VENTOY || { echo "Failed to mount $VENTOY"; exit 1; }
fi

if ! mountpoint -q $MDSATA; then
    mount /dev/sdd3 $MDSATA || { echo "Failed to mount $MDSATA"; exit 1; }
fi
DATE=$(date +"%Y-%m-%d")
echo "Removing folder: $EGGS_DIRECTORY..."
sudo rm -rfv $EGGS_DIRECTORY >/dev/null 2>&1


while true; do

    length=$(find $FILEPATH -maxdepth 1 -name "*.iso" | wc -l)

    if [ "$length" -gt 0 ]; then

        echo ".iso file(s) found in: "
        echo
        find $FILEPATH -maxdepth 1 -name "*.iso" -exec echo "- {}" \;

        echo -e "\nwait...\n"
        echo -e "\n\033[01;05;37mRenamed your iso file to : 'ARCHLINUX_$DATE.iso'!\033[00;37m\n"
        echo -e "Moving file to $VENTOY ...\n"
        mv -v $FILEPATH/*.iso $FILEPATH/ARCHLINUX_$DATE.iso
        sleep 1
        time mv -v $FILEPATH/*.iso $VENTOY
        echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

        echo -e "\ncreating a backup for : '$MDSATA'"
        watch df -h $MDSATA
        rsync -avh --progress $VENTOY/ARCHLINUX_$DATE.iso $MDSATA


	echo -e "\n\033[01;05;37mEggs directory was removed! : Eggs directory was removed!!!\033[00;37m\n"
	echo -e "\n\033[01;05;37mupload the file : 'ARCHLINUX_$DATE.iso' to Google Drive now!!\033[00;37m\n"
        $LINE_SCRIPT
        break

    else
        echo -e "\nNo .iso file found in $FILEPATH. Generating new .iso file...\n"
        eggs produce --clone --prefix=ARCHLINUX --basename=_$DATE
        break
    fi
done
