#!/bin/bash
array=()
inicializar ()
{
    array=()
}

agregar_elem ()
{
    array[${#array[@]}]=$1
}

eliminar_elem ()
{
    if [[ $1 =~ [0-9] ]] && [ $1 -gt 0 ] && [ $1 -lt ${#array[@]} ]; then
        unset array[$1]
    else
        echo "La posicion indicada no es valida."
        #??? exit 1
    fi
}

longitud ()
{
    echo "Longitud del arreglo: ${#array[@]}"
}

imprimir ()
{
    echo "Contenido del arreglo: ${array[@]}"
}

inicializar_Con_Valores ()
{
    array=()
    for (( i=0; i<$1; i++ )); do
        array[${#array[@]}]=$2
    done
}


select opcion in inicializar agregar_elem eliminar_elem longitud imprimir inicializar_Con_Valores exit; do
    case $opcion in
    "inicializar")    
        $opcion;;
    "agregar_elem")
        echo "Ingrese dato a guardar en el arreglo:"
        read dato
        $opcion $dato;;
    "eliminar_elem")
        echo "Ingrese posicion a eliminar del arreglo"
        read pos
        $opcion $pos;;
    "longitud")
        $opcion;;
    "imprimir")
        $opcion;;
    "inicializar_Con_Valores")
        echo "Ingrese longitud deseada del arreglo:"
        read longitud
        echo "Ingrese dato a guardar en todas las posiciones del arreglo:"
        read dato
        $opcion $longitud $dato;;
    "exit")
        exit 0;;
    esac
done
