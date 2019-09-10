#/bin/bash
#
# Script para solucionar problema con WPS en Manjaro
#
cd /usr/share/mime/packages/
sudo rm wps-office-et.xml 
sudo rm wps-office-wpp.xml
sudo rm wps-office-wps.xml
sudo update-mime-database /usr/share/mime
