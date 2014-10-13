#!/bin/bash
function clonar(){
 clear
 echo dd if=/home/mortasoft/imagen.dd of=/dev/sde  # Para clonar discos duros.
 read -p ""
 exit 0
}

function verInformacionPC(){
 clear
 cat /proc/version | grep "Linux version"
 cat /proc/cpuinfo | grep "model name"
 read -p ""
 exit 0
}

function ver(){
 clear
 echo "Para agregar un script como si fuera un comando del sistema: "
 echo "  sudo mv NOMBREDELSCRIPT.sh /usr/bin"
 echo 
 echo 
 echo 
 read -p ""
 exit 0
}


while [ "$opcion" != 4 ]
do
 clear
 echo " Escoja una opción "
 echo "1. Clonar Disco Duro "
 echo "2. Instalaciones Ubuntu "
 echo "3. Instalaciones Mint"
 echo "4. Instalaciones Manjaro"
 echo "5. Ver Informacion PC "
 echo "6. Ver documentacion importante"
 read -p "Seleccione una opción: " opcion
 case $opcion in
   1) clonar;;  
   5) verInformacionPC;;  
   6) ver;;
   4) exit 0;;
   *) echo "$opcion es una opcion invalida.";
   echo "Presiona una tecla para continuar...";
   read foo;;
   esac
done


