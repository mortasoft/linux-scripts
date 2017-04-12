#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   23 de Mayo 2013
#  Actualizado el 26/7/14
#
#  Actualizado 17/09/2016 
#

array=( # Array de elementos a instalar.

# Internet
filezilla
zenmap
remmina

# Utilidades
shutter
openssh-server
banshee
docky

# Desarrollo
geany
netbeans

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
