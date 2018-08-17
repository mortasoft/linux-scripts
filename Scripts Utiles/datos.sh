#!/bin/bash
echo -e "Escribe un numero por favor: "
 read numero
tope=$numero
#numero=$1
#tope=$numero
clear
for (( numero; numero>=0; numero-- ))
do
if [ $numero = $tope ]
  then
	echo "El numero es: $numero"
  else
   echo "Numero Anterior $numero "
fi
   
done


