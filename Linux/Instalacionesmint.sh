#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
#  
# 
#
#

array=( # Array de elementos a instalar.

remmina
geany
guake
pdfmod
apcalc
shutter
openssh-server
skype              # No esta en los repositorios de Ubuntu
virtualbox-4.2
chromium-browser
inkscape
k3b
filezilla
liferea
thunderbird
putty
zenmap
wine1.4
banshee
vlc
dia
cairo-dock
xbmc
netbeans
kompozer

#  ubuntu-restricted-extras # SOLO PARA UBUNTU

) 

echo "................................Actualizando paquetes.........................................."
sudo apt-get update

echo "................................Instalando lista de Programas Basicos.........................................."

# Ciclo de instalación de los programas
for i in "${array[@]}"
do
   :
   echo "................................Instalando el paquete....................................................." $i
   sudo apt-get -y install $i
done
