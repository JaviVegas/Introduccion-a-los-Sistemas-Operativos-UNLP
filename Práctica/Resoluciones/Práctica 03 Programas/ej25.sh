#!/bin/bash
arreglo=()


if [ $# -gt 2 ]; then
    echo "Se ingresaron demasiados parametros. Max 2 (-b nro, -l, -i)"
    exit 1
fi


for i in (cat /etc/passwd | grep "users" | cut -d: -f4); do
    arreglo[${#arreglo[@]})]=$i
done

if [ $# -eq 1 ]; then
    if [ $1 -eq "-l" ]; then
        echo "Longitud del arreglo: ${#arreglo[@]}"
        
    elif [ $1 -eq "-i" ]; then
        echo "Elementos del arreglo: ${arreglo[@]}"
        
    else
        echo "Se esperaba uno de los siguientes parametros: -l , -i"
        exit 2
    fi
fi


if [ $# -eq 2 ]; then
    if [ $1 -eq "-b" ] && [ $2 =~ [0-9] ]; then
        
        if [ $2 -ge 0 ] && [ $2 -lt ${#arreglo[@]} ]; then
            echo "Usuario en la pos $2 del arreglo: ${arreglo[$2]}"
        else
            echo "No existe elemento en esa posicion. Vuelva a intentarlo."
            exit 3
        fi
    else
        echo "Se esperaban 1er parametro -b y 2do parametro un numero entero mayor o igual a cero."
        exit 4
    fi
fi
