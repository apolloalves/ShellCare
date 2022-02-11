#!/bin/bash
echo -n 'Do you want to open stacer? (y/n)'
read -r stacer_question


if test "y" = "$stacer_question"

   then

         echo "initializing stacer..."
         sudo stacer &        
         echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'
         echo "initializing timeshift..."
         sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.0.sh ]' --tags D
         echo -e '\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n'
         neofetch
   
   elif test "n" = "$stacer_question"
     
      then
      echo -n 'Can I create a new snapshot containing the current state of the system? (y/n)'
      read -r timeshift_question
        
         if test "y" = "$timeshift_question"

            then

               echo "initializing timeshift..."
               sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.0.sh ]' --tags D
               echo -e '\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n'
               echo -e "\033[01;31mCreating snapshot...\033[00;37m"
               neofetch 
                                
         elif test "n" = "$timeshift_question"
                        
               then 
               echo "Generating the list of snapshots..."
               sudo timeshift --delete
               neofetch
         
         elif
               test "y" || "n" != "$stacer_question" 
               then
               echo "invalid arguments!"   
           
         fi

   elif test "y" || "n" != "$stacer_question"
      then
      echo "invalid arguments!"   

fi

