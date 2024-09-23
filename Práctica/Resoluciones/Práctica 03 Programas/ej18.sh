#!/bin/bash
if [[ $# = 1 ]] then
    $encontre = false
    while (!$encontre) do
        if [[ $(expr $SECONDS % 10) = 0 ]] then
            who | grep $1 && {
            
            echo "$1 esta logeado."
            $encontre = true
            exit 0
    
            } || {
    
            echo "$1 no esta logeado."
            exit 1
            
            }
        fi
    done
    
else
    echo "Se esperaba un parametro (Nombre de usuario)."
fi
