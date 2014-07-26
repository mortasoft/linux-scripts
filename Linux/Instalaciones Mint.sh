#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
#

array=( # Array de elementos a instalar.

# Internet
remmina
chromium-browser
skype
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
# Programacion
netbeans
geany
kompozer
bluefish

) 

echo ".............Actualizando paquetes............."
sudo apt-get update > /dev/null

echo ".......Instalando lista de Programas Basicos..............."

# Ciclo de instalación de los programas
for i in "${array[@]}"
do
   :
   # Esto es para hacerlo en interfaz grafica zenity --info --text="Instalando el paquete $i"
   echo "Instalando $i"
   sudo apt-get -y install $i > /dev/null
done
