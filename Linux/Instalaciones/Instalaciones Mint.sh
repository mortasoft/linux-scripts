#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
# 
#  Actualizado el 26/7/14

array=( # Array de elementos a instalar.

# Internet
remmina
chromium-browser
skype
filezilla
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
docky

# Multimedia
inkscape
k3b
banshee
vlc
xbmc
xfburn

# Oficina
thunderbird

# Programacion
# netbeans
geany
#bluefish

) 

echo ".............Actualizando paquetes............."
sudo apt-get update > ~/log.txt

echo ".......Instalando lista de Programas Basicos..............."

# Ciclo de instalación de los programas
for i in "${array[@]}"
do
   :
   # Esto es para hacerlo en interfaz grafica zenity --info --text="Instalando el paquete $i"
   echo "Instalando $i"
   sudo apt-get -y install $i >> ~/log.txt
done
