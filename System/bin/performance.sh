#!/bin/bash
#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #-
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

#########################################################################################################################
# This is a bash script that performs performance optimizations on the system. I'll explain what each part does:        #
#                                                                                                                       #
# The script starts with a performance optimization message.                                                            #
#                                                                                                                       #
# Next, commands are executed to clear the system cache using the drop_caches kernel parameter. These commands are run  #
# with superuser (sudo) privileges. The drop_caches parameter allows releasing the disk cache memory (pagecache), the   #
# inodes and dentries cache memory and the object slabs cache memory.                                                   #
#                                                                                                                       #
# After clearing the cache, a message is displayed indicating that the operation completed successfully.                #
#                                                                                                                       #
# The next section of the script runs the prelink command for optimizing shared libraries. prelink is a tool            #
# that pre-allocates memory addresses for shared libraries, speeding up program load times. The prelink -amR            #
# and /etc/cron.daily/prelink commands are run with superuser privileges to perform the optimization.                   #
#                                                                                                                       #
# Then, the script cleans up the RAM using the drop_caches parameter again.                                             #
#                                                                                                                       #
# Finally, a message is displayed indicating that the RAM cleaning was successfully completed.                          #
#                                                                                                                       #
# Note: The script uses commands with superuser (sudo) privileges, so you need to run it with proper permissions. Also, #
# it is important to be careful when running scripts that make changes to the system, as they can affect the normal     #
# functioning of the operating system.                                                                                  #
#                                                                                                                       #
#                                                                                                                       #
#########################################################################################################################

    echo -e "\n Optiminzing performance system...\n"
    sleep 2
    echo -e "\n\033[01;32mCleaning drop_caches...\033[00;37m\n"
	
    sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    #####################################################################################################################
    #PRELINK
    #####################################################################################################################
    echo -e "\n\033[01;32mExecuting prelink...\033[00;37m\n"
    sleep 1
    sudo prelink -amR
    sudo /etc/cron.daily/prelink
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    
    #####################################################################################################################
    #RAM MEMORY
    #####################################################################################################################
    echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"
    sleep 1 
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    sleep 1 
    echo -e "\n\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
    #####################################################################################################################
  
