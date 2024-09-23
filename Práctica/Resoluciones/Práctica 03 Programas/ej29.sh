#!/bin/bash
array=()

for i in `ls $HOME`; do
    test -f $i 
    if [ $? = 1 ]; then
        # get_nombre: ${archivo%.*}
        # get_extension: ${archivo##*.}
        if [ ${i##*.} = "doc" ]; then
            echo "$i es un archivo doc"
            array[${#array[@]}]=$i
        fi
    fi
done

echo ${array[@]}
echo ""

verArchivo ()
{
    encontre=false
    for ((i=0; i<${#array[@]}; i++)); do
        if [ $1 = ${array[i]} ]; then
            cat $HOME/${array[i]}
            encontre=true
            break
        fi
    done
    
    if [ $encontre = false ]; then
        echo "Archivo $1 no encontrado"
        return 5
    fi
}

cantidadArchivos ()
{
    echo "Cantidad de archivos: ${#array[@]}"
}

borrarArchivo ()
{
    encontre=false    
    for ((i=0; i<${#array[@]}; i++)); do
        if [ $1 = ${array[i]} ]; then
            
            echo "Quiere eliminar el archivo solo logicamente? s/n"
            read respuesta
                            
            if [ $respuesta = "n" ]; then
                rm $HOME/${array[$i]}
                echo "Borrado del FileSystem."
            fi
            unset array[$i]
            
            encontre=true
            break
        fi
    done
    
    if [ $encontre = false ]; then
        echo "Archivo $1 no encontrado"
        return 10
    fi
}


select opcion in verArchivo cantidadArchivos borrarArchivo exit; do
    case $opcion in
    "verArchivo")
        echo "Ingrese el nombre del archivo que desea ver:"
        read archivo
        $opcion $archivo;;
    "cantidadArchivos")
        $opcion;;
    "borrarArchivo")
        echo "Ingrese el nombre del archivo que quiere borrar:"
        read arch
        $opcion $arch;;
    "exit")
        exit 0;;
    esac
done
