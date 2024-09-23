#!/bin/bash
# $* para trabajar sobre una cantidad dinamica de parametros que me pasaron.
if [[ $# -eq 3 ]] then
    test -d $1
    if [[ $? -eq 0 ]] then
        
        case $2 in
        "-a")
            for file in 'ls $1'; do
                mv $1/$file $1/$file$3
            done;;
        "-b")
            for file in 'ls $1'; do
                mv $1/$file $1/$3$file
            done;;
        *)
            echo "No se reconoce la accion. Se esperaba '-a' o '-b'."
            echo "Se esperaban tres parametros (dir '-a / -b' cadena). Vuelva a intentarlo.";;
        esac
    
    else
        echo "No se encontro el directorio $1"
        echo "Se esperaban tres parametros (dir '-a / -b' cadena). Vuelva a intentarlo."
    fi
else
    echo "Se esperaban tres parametros (dir '-a / -b' cadena). Vuelva a intentarlo."
fi
