#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Octubre 2016
# 

# Comprimir: tar -czfv archivo.tar.gz ficheros
# Descomprimir: tar -xzvf archivo.tar.gz
# Ver contenido: tar -tzf archivo.tar.gz

# pv /var/log/syslog | zip > syslog.zip

if [ $1 = "-backup" ]; then
   echo "Comprimiendo carpeta....."
   cd ~
   #tar -czf - .local/share/wesnoth/1.12/ | (pv -p --timer --rate --bytes > ~/respaldoWesnoth.tgz)
   #tar -czf - .local/share/wesnoth/1.12/ | (pv -n > ~/respaldoWesnoth.tgz) 2>&1 | dialog --gauge "Realizando la copia" 10 70
else
  if [ $1 = "-restore" ]; then
  echo "Descomprimiendo la carpeta"
  else
  echo "Formato Incorrecto"
  echo $1
 fi
fi 

