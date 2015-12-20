#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   23 de Mayo 2013
#  Actualizado el 26/7/14
#

array=( # Array de elementos a instalar.

# Internet
skype
putty
filezilla
zenmap
remmina

# Utilidades
pdfmod
shutter
openssh-server
virtualbox-4.2
banshee
docky

# Desarrollo
geany
netbeans
kompozer

) 

echo "................................Actualizando paquetes.........................................."
sudo pacman -Syyu

echo "................................Instalando lista de Programas Basicos.........................................."

# Ciclo de instalación de los programas
for i in "${array[@]}"
do
   :
   echo "................................Instalando el paquete....................................................." $i
   sudo pacman -S $i
done
