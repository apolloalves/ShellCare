#!/bin/bash
##########################################################################################################################
# Carbonara                                  										 #
# Script:enable__services.sh                										 #
# Author : Apollo Alves                     										 #
# Date : 21/11/2024                        									         #
#														         #
# Description: This is a bash script that enables some system services at boot. I'll explain what each part does:        #
# The script starts with a header that contains information about the author and creation date.                          #
#                                                                                                                        #
# Then there is an annotated section that explains the reasons for enabling each service. These services are considered  #
# potential security risks or are not needed in certain scenarios.                                                       #
#                                                                                                                        #
# After explanatory comments, the script enables each service using the command systemctl enable <service_name>. It then #
# checks the status of the service using systemctl status <service_name> and displays a message indicating whether the   #
# service was successfully enabled.                                                                                      #
#                                                                                                                        #
# Between each section of enabling the service, the script calls the line_script.sh file, which is likely                #
# responsible for displaying a separator carbo__LineScript.sh in the terminal output.                                    #
#                                                                                                                        #
# Here is a brief explanation of the enabled services:                                                                   #
#                                                                                                                        #
# bluetooth.service: Bluetooth service.                                                                                  #
# accounts-daemon.service: User account management service.                                                              #
# avahi-daemon.service: service for zero-configuration network discovery (mDNS).                                         #
# brltty.service: Braille device support service.                                                                        #
# debug-shell.service: systemd debug shell service.                                                                      #
# ModemManager.service: mobile broadband interface control service.                                                      #
# warsaw.service: service related to ITAU Bank.                                                                          #
# mysql.service: MySQL service.                                                                                          #
# networkd-dispatcher.service: systemd network dispatcher service.                                                       #
# systemd-networkd.service: systemd network management service.                                                          #
# cups.service: printing service.                                                                                        #
# apport.service: Ubuntu bug reporting service.                                                                          #
# openvpn.service: OpenVPN service.                                                                                      #
# vboxautostart-service.service: VirtualBox autostart service.                                                           #
# vboxballoonctrl-service.service: VirtualBox balloon control service.                                                   #
# vboxdrv.service: VirtualBox driver service.                                                                            #
# vboxweb-service.service: VirtualBox web service.                                                                       #
# 															 #
# Bluetooth : is a potential security risk. It is part of AccountsService, which allows programs  			 #
# to get and manipulate user account information. I can’t think of a good reason to allow this kind of   		 #
# behind-my-back operations, so I mask it.                                                               		 #
#															 #
# Note: Some parts of the script are commented out, which means that these parts are not executed. Therefore, these      #
# services will not be enabled.                                                                                          #
##########################################################################################################################

# Check if the user is root
source 'carbo__verifyRoot.sh'

echo -e "\nenabling natives services system..."
echo "enabling bluetooth.service"
echo
systemctl enable bluetooth.service
sleep 1
systemctl status bluetooth.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# enable accounts-daemon : is a potential security risk. It is part of
# AccountsService, which allows programs to get and manipulate user account
# information. I can’t think of a good reason to allow this  kind of
# behind-my-back operations, so I enable it.
################################################################################

echo "enabling accounts-daemon.service..."
echo
systemctl enable accounts-daemon.service
sleep 1
systemctl status accounts-daemon.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# enable avahi-daemon.service : is supposed to provide zero-configuration
#network discovery, and make it super-easy to find printers and other hosts on
# your network. I always enable it and don’t miss it.
################################################################################

echo "enabling avahi-daemon.service..."
echo
systemctl enable avahi-daemon.service
sleep 1
systemctl status avahi-daemon.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# enable brltty.service : provides Braille device support, for example, Braille
# displays.
################################################################################

echo "enabling brltty.service..."
echo
systemctl enable brltty.service
sleep 1
systemctl status brltty.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# enable debug-shell.service : opens a giant security hole and should never be
# enabled except when you are using
# it. This provides a password-less root shell to help with debugging systemd
# problems.
################################################################################

echo "enabling debug-shell.service..."
echo
systemctl enable debug-shell.service
sleep 1
systemctl status debug-shell.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# ModemManager.service : is a DBus-activated daemon that controls mobile
# broadband (2G/3G/4G) interfaces. If you don’t have a mobile broadband
# interface — built-in, paired with a mobile phone via Bluetooth, or USB dongle
# you don’t need this.                                                                                                                                                                                            #
################################################################################

echo "enabling ModemManager.service..."
echo
systemctl enable ModemManager.service
systemctl status ModemManager.service
sleep 1
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# pppd-dns.service is a relic of the dim past. If you use dial-up Internet,
# keep it. Otherwise, you don’t need it. #
################################################################################

echo "enabling pppd-dns.service..."
systemctl enable pppd-dns.service
systemctl status pppd-dns.service
sleep 1
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# Warsaw Service : Remove service ITAU Bank
################################################################################

echo -e "enabling warsaw service..."
echo
systemctl enable warsaw.service
sleep 1
systemctl status warsaw.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# mysql.service
################################################################################

echo -e "enabling mysql service..."
echo
systemctl enable mysql.service
sleep 1
systemctl status mysql.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# Network Dispatcher Services
################################################################################

echo -e "enabling network-dispatcher services..."
echo
systemctl enable networkd-dispatcher.service systemd-networkd.service
sleep 1
systemctl status networkd-dispatcher.service systemd-networkd.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# cups.service
################################################################################

echo -e "enabling cups.service..."
echo
systemctl enable cups.service
sleep 1
systemctl status systemctl enable cups.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# apport.service
################################################################################

echo -e "enabling cups.service..."
echo
systemctl enable apport.service
sleep 1
systemctl status systemctl apport.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# openvpn.service
################################################################################

echo -e "enabling enable openvpn.service..."
echo
systemctl stop openvpn.service
systemctl enable openvpn.service
sleep 1
systemctl status systemctl openvpn.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# virtualbox services
################################################################################

echo -e "enabling cups.service..."
echo
systemctl enable vboxautostart-service.service
systemctl enable vboxballoonctrl-service.service
systemctl enable vboxdrv.service
systemctl enable vboxweb-service.service
sleep 1
systemctl status vboxautostart-service.service
echo
systemctl status vboxballoonctrl-service.service
echo
systemctl status vboxdrv.service
echo
systemctl status vboxweb-service.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh

################################################################################
# teamviewerd.service
################################################################################

TeamViwer Service
echo -e "enabling teamviewer services..."
echo
systemctl status teamviewerd.service
sleep 1
systemctl enable teamviewerd.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
carbo__LineScript.sh
