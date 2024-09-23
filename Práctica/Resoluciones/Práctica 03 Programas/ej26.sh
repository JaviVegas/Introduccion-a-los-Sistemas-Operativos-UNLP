#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Se esperaba al menos un parametro."
    exit 1
fi

rutas=()
for i in $*; do
    rutas[${#rutas[@]}]=$i
done

echo ${rutas[@]}

inexistentes=0
for ((i=0; i < ${#rutas[@]}; i++)); do
    
    if [ $(expr $i % 2) -eq 0 ]; then
        
        test -d ${rutas[$i]}
        if [ $? -eq 0 ]; then
            echo "${rutas[$i]} existe y es un directorio."
        
        else            
            test -f ${rutas[$i]}
            if [ $? -eq 0 ]; then
                echo "${rutas[$i]} existe y es un archivo."
            
            else
                echo "No existe ${rutas[$i]} en el sistema."
                ((inexistentes++))
            fi
        fi        
    fi    
done

echo "Cantidad de archivos o directorios inexistentes en el sistema: $inexistentes"
