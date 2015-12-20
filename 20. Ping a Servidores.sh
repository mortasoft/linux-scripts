#!/bin/bash
# pingservers.sh
# ==============
# Hace ping a una lista de direcciones IP, revisa si los servidores estan activos o no.
# Escrito por:I. Attir
# http://www.good-linux-tips.com/2014/06/script-checking-if-servers-are-up.html
#
# Modificaciones y traducción al Español por: Francisco J. de la Torre Inguanzo
# http://linuxmanr4.com/2014/06/06/script-en-bash-que-hace-ping-tus-servidores/
#
# Se debe de hacer un archivo txt con todas las direcciones IP a analizar y pasarlo como
# parametro al script
 
clear
 
if [ "$1" = "" ] ; then  # No se pasó una lista de ips
   echo "Error: Por favor introduce un nombre de archivo válido, que contenga las direcciones IP para hacer ping."
exit 1
fi
if [ ! -f "$1" ] ; then  # Archivo inválido.
   echo "Error: No puedo encontrar el archivo "$1"."
exit 2
fi
 
echo "(*) Haciendo ping a los servidores contenidos en el archivo "$1", por favor espere..."
echo
 
while read IP
do
   ping -c 3 "$IP" >& /dev/null
   
 if [ "$?" != "0" ] ; then   # Houston, tenemos un problema.
   (echo -n "$IP  " ; date) | tee -a noping.log
   echo -e     "${IP} !!! \e[0;31m[X]\e[1;37m"
   nmap "$IP"
 else echo -e  "$IP \e[1;32m[OK]\e[1;37m"
 fi
done < "$1"
echo
echo "Listo!!!"
