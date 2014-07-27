dpkg --get-selections > listadepaquetesdebinstalados

#Restaurando los paquetes
dpkg --set-selections < listadepaqueresdebinstalados
apt-get update
apt-get dselect-upgrade
apt-get dist-upgrade