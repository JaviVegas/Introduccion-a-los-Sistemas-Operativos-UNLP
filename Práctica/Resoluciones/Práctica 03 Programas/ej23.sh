#!/bin/bash
arreglo=(0 1 2 3 4 5 6 7 8 9)
impares=()
suma_impares=0

for i in ${arreglo[@]}; do
    if [ $(expr $i % 2) -eq 0 ]; then
        echo $i
    else
        ((suma_impares+=$i))
        impares[${#impares[@]}]=$i
    fi
done

echo "Nros Impares: ${impares[@]}"
echo "Total Suma Impares: $suma_impares"
