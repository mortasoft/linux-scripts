#!/bin/bash

#
# Desarrollado por Mario Zamora Madriz
#   25 de Abril 2013
# 
#  Actualizado el 26/7/14

# Numix Circle Icons
sudo add-apt-repository ppa:numix/ppa -y

# Papirus
sudo add-apt-repository ppa:papirus/papirus -y

# Moka / Paper Icons
sudo add-apt-repository ppa:snwh/ppa -y

# Java
sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:mystic-mirage/pycharm -y # PyCharm Entorno Python
sudo add-apt-repository ppa:libreoffice/ppa -y # LibreOffice Stable

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

array=( # Array de elementos a instalar.

# Internet
remmina
filezilla
putty
youtube-dl

# Seguridad
zenmap
wireshark
etherape
denyhosts
clamav
hping3
hexchat

# Herramientas
guake
shutter
openssh-server
apcalc
docky
oracle-java8-installer
grsync
testdisk
screen
cryptsetup
vokoscreen

# Multimedia
inkscape
banshee
vlc
minitube
mixxx
ffmpeg
# xfburn Obsoleto

# Oficina
#thunderbird Obsoleto
calibre

# Desarrollo
netbeans
# Sublime Text
apt-transport-https
sublime-text
geany
glade
meld
pycharm-community
#bluefish

# Idiomas
language-pack-gnome-es 
language-pack-es 
language-pack-kde-es 
libreoffice-l10n-es 

# Utilidades
# ttf-mscorefonts-installer
gparted
furiusisomount
virtualbox
virtualbox-guest-additions-iso
virtualbox-ext-pack
virtualbox-qt

# Herramientas de Descompresion
unace 
unrar 
zip 
unzip 
p7zip-full 
p7zip-rar 
sharutils 
rar
# Numix Icons
numix-gtk-theme
numix-icon-theme-circle
papirus-icon-theme
paper-icon-theme
moka-icon-theme


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