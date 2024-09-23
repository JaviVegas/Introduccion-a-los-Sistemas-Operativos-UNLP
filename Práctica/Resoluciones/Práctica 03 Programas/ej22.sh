#!/bin/bash
num=(10 3 5 7 9 3 5 4)

productoria ()
{
    producto=1
    for i in ${num[@]}; do
        producto=$(expr $producto \* $i)
    done
    
    echo $producto
}


productoria
