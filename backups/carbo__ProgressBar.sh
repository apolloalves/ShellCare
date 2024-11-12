#!/bin/bash

clear
# Exibe mensagem em amarelo negrito
echo -e "\n\033[1;33mEXECUTING BACKUP OF ROOT FOLDER\033[0m"

(
    # Loop de progresso
    while true; do
        for i in {0..100}; do
            # Imprime a porcentagem
            echo -ne "\rProgress: $i% ["
            # Imprime a barra de progresso
            for ((j=0; j<i/2; j++)); do
                echo -n "="
            done
            for ((j=i/2; j<50; j++)); do
                echo -n " "
            done
            echo -n "]"
            sleep 0.1
        done
        break
    done
) &

# Guarda o PID do processo de loop
LOOP_PID=$!

# Exec anyway
fstrim -av
# Quando o backup terminar, o laço é finalizado
kill $LOOP_PID
