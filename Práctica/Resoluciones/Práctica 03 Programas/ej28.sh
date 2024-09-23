#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Se esperaba un parametro. Vuelva a intentarlo."
    exit 1
fi


test -d $1
if [ $? -ne 0 ]; then
    echo "$1 no es un directorio del sistema."
    exit 4
    
else
    cant_lectura=0
    cant_escritura=0
    for i in `ls $1 -l`; do
        
        test -f $i
        if [ $? -eq 0 ]; then
            permisos=`ls $i -l | cut -d" " -f1 | head -c 3`
            
            if [ $permisos = "-r-" ]; then
                (($cant_lectura+=1))
            
            elif [ $permisos = "--w" ]; then
                (($cant_escritura+=1))                
            
            elif [ $permisos = "-rw" ]; then
                ((cant_lectura+=1))
                ((cant_escritura+=1))
            fi
        fi
    done
    
    echo "Cantidad Lectura: $cant_lectura"
    echo "Cantidad Escritura: $cant_escritura"
fi
