#!/bin/bash

test -d $HOME/bin
if [ $? -ne 0 ]; then
    echo "No existe el dir... lo creo."
    mkdir $HOME/bin
else
    echo "Ya existe el dir bin."
fi

total=0
for i in `ls .`; do
    if [ ${i%.*} != "ej30" ]; then # Solo para evitar mover este script.
        test -f $i
        if [ $? -eq 0 ]; then
            echo "Moviendo archivo $i..."
            mv $i $HOME/bin
            ((total+=1))
        fi
    fi
done

if [ $total -gt 0 ]; then
    echo "Cantidad de archivos movidos: $total"
else
    echo "No se ha movido ningun archivo, porque no habia..."
fi

