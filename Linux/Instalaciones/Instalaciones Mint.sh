#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
# 
#  Actualizado el 26/7/14

array=( # Array de elementos a instalar.

# Internet
remmina
skype
krdc
filezilla
putty
zenmap

# Herramientas
guake
pdfmod
shutter
openssh-server
virtualbox-4.3
wine1.4
cairo-dock
apcalc
docky

# Multimedia
inkscape
k3b
banshee
vlc
minitube
xbmc
xfburn

# Oficina
thunderbird

# Programacion
# netbeans
geany
#bluefish

# Idiomas
language-pack-gnome-es 
language-pack-es 
language-pack-kde-es 
libreoffice-l10n-es 
thunderbird-locale-es 
thunderbird-locale-es-es

# Utilidades
ttf-mscorefonts-installer
gparted
furiusisomount

# Herramientas de Descompresion
unace 
unrar 
zip 
unzip 
p7zip-full 
p7zip-rar 
sharutils 
rar

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

echo "Instalando Screnfetch"
cd /usr/bin
sudo wget -c https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev -O screenfetch
sudo chmod +x screenfetch

sudo apt-get autoremove
sudo apt-get autoclean


