#!/bin/bash
clear
echo "Opeciones del Menu Email"
echo
echo "Opcion 1 : Enviar correo"
echo -n "Ingrese el numero de la opcion: "

read opcion

if [ $opcion -eq 1 ];
then
echo "BOMBER MAIL"
echo ""
echo "Introduce el texto del correo"
read texto

echo "Introduce asunto para el correo"
read cabezera

echo "Introduce la dirección del destinatario"
read direccion

echo "¿Cuántos correos envío?"
read x

a=0
echo "BOOOOOOOMMMM!!"

while [ $a -ne $x ]
do
echo $texto | mail -s "$cabezera" $direccion
a=$[ $a + 1 ]
done
fi