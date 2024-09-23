#!/bin/bash
pila=()

push ()
{
    pila[${#pila[@]}]=$1
}

pop ()
{
    if [ ${#pila[@]} -eq 0 ]; then
        echo "La pila ya esta vacia"
    else
        unset pila[${#pila[@]}-1]        
    fi
}

length ()
{
    echo "Tamaño de pila: ${#pila[@]}"
}

print ()
{
    echo "Todos los elementos en la pila:"
    echo ${pila[@]}
}

while true; do
    select opcion in push pop length print exit; do
        case $opcion in
        "push")
            echo "Ingrese dato a apilar:"
            read dato
            push $dato;;
        "pop")
            pop;;
        "length")
            length;;
        "print")
            print;;
        "exit")
            exit 0;;
        esac
    done
done


