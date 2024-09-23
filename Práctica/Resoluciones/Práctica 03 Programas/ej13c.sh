#!/bin/bash
if [[ $# = 1 ]] then
    test -f $1
    if [[ $? = 0 ]] then
        echo "$1 existe y es un archivo."
    else
        test -d $1
        if [[ $? = 0 ]] then
            echo "$1 existe y es un directorio."
        else
            echo "No existe archivo ni directorio con nombre $1 -- Creando directorio con ese nombre..."
            mkdir $1
        fi
    fi
else
    echo "Por favor, ingrese un solo parametro"
fi
