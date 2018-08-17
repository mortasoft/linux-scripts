#!/bin/bash
#  
#  Copyright 2016 Mario Zamora <mario@rata>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
  user=`logname`
  nombre="secret"

if [ "$EUID" -ne 0 ]; then 
  echo "Debe ejecutar este comando como root"
  exit
else
 if [ $# == 1 ]; then
  echo "Creando carpeta para volumen encriptado..."
  mkdir -p /media/$nombre
  clear
  echo "Configurando volumen encriptado..."
  cryptsetup luksClose $nombre  
  cryptsetup luksOpen $1 $nombre
  echo "Montando el volumen..."
  mount /dev/mapper/$nombre /media/$nombre
  echo "Operación finalizada..."
 else
    echo "Parámetros incorrectos, el parametro es la ruta del archivo encriptado"
fi
fi











