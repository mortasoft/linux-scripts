#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
#
# 1.4 25/05/16 Agregados algunas cosas
#
#
#
#
#

#
# Agregando repositorios adicionales
#
sudo add-apt-repository ppa:numix/ppa -y

array=( # Array de elementos a instalar.

# Programacion
netbeans
geany
# Internet
remmina
chromium-browser
filezilla
putty
zenmap
# Herramientas
guake
pdfmod
shutter
openssh-server
virtualbox
wine
cairo-dock
apcalc
# Multimedia
inkscape
banshee
vlc
ubuntu-restricted-extras # SOLO PARA UBUNTU
xfburn
# Oficina
thunderbird
dia
# Numix Icons
numix-gtk-theme
numix-icon-theme-circle
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
