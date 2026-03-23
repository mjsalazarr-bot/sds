#!/bin/bash

export FILENAME=${FILENAME:-"default"}


while true; do
	echo "Opcion 1, crear entorno"
	echo "Opcion 2, "
	echo "Opcion 3"
	echo "Opcion 4"
	echo "Opcion 5"
	echo "Opcion 6"
	read -p "Opcion nro: "	opcion

	case $opcion in
		1)
			mkdir EPNro1
			cd EPNro1
			mkdir -p {salida,entrada,procesado}
			;;
		2)
			nohup ./consolidar.sh &
			;;
		3)
			if [ -f "~/salida/$FILENAME.txt" ]; then
				sort -n -k1 "~/salida/$FILENAME.txt"
			else
				echo "El archivo no existe"
			fi
			;;
		4)	if [ -f "~/salida/$FILENAME.txt" ]; then
				# -k5: ordena la columna 5 (la nota)
				#-n: ordena numericamente
				#-r: reverse (de mayor a menor)
				#head -n: recorta la salida para mostrar 10 resultados
				sort -k5 -n -r "~/salida/$FILENAME.txt" | head -n 10
			else
				echo "EL archivo no existe"
			fi
			;;
		5)
			echo -n "Ingrese un padron: "
			read padron
			if [ -f "~/salida/$FILENAME.txt"]; then
				# Usando ^ para que solo coincida el inicio
				grep "^$padron" "~/salida/$FILENAME.txt"
			else
				echo "El archivo no existe"
			fi
			;;
		6)
			echo "salir"
			break
			;;
	esac
done
