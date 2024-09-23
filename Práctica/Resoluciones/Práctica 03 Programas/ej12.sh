#!/bin/bash

#INCISO A
#echo "Ingrese el primer numero:"
#read NUM1
#echo "Ingrese el segundo numero"
#read NUM2

#echo "Suma: $(expr $NUM1 + $NUM2)"
#echo "Resta: $(expr $NUM1 - $NUM2)"
#echo "Producto: $(expr $NUM1 \* $NUM2)"
#echo "Division: $(expr $NUM1 / $NUM2)"

#if [[ $NUM1 > $NUM2 ]]
#then
#    echo "El numero mayor es $NUM1"
#else
#    echo "El numero mayor es $NUM2"
#fi

#INCISO B + C
if [[ $# -ne 3 ]]
then
    echo "Por favor, ingrese 3 parametros..."

else
    if [[ $1 =~ [0-9] ]] && [[ $2 =~ [-,+,"\*",/] ]] && [[ $3 =~ [0-9] ]]
    then
        echo "Operacion: $1 $2 $3 = $(expr $1 $2 $3)"

        if [[ $1 > $3 ]]
        then
            echo "El numero mayor es $1"
        else
            echo "El numero mayor es $3"
        fi
    else
        echo "Mandaste cualquier banana amigo..."
    fi
fi
