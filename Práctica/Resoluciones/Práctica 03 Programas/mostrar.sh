#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido

echo "Fecha y hora actual:"
date

echo "Su apellido y nombre es:"
echo "$apellido $nombre"

echo "Su usuario es: `whoami`"

echo "Su directorio actual es:"
readlink -f mostrar.sh
realpath -s mostrar.sh

echo "Contenido del directorio actual:"
ls

echo "Ingrese el nombre de su carrera:"
read carrera
echo "$nombre $apellido es alumno de $carrera"

echo "Este script se llama $0 y recibió cómo parámetro/os:"
echo "Par 1: $1, Par 2: $2, Par 3: $3"
echo "Cantidad total de parámetros: $#"
