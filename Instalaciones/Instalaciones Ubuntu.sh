#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
#

array=( # Array de elementos a instalar.

# Programacion
netbeans
geany
kompozer
# Internet
remmina
chromium-browser
filezilla
liferea
putty
zenmap
# Herramientas
guake
pdfmod
shutter
openssh-server
virtualbox-4.2
wine1.4
cairo-dock
apcalc
# Multimedia
inkscape
k3b
banshee
vlc
xbmc
ubuntu-restricted-extras # SOLO PARA UBUNTU
xfburn
# Oficina
thunderbird
dia

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
