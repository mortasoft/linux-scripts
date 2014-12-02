#!/bin/bash
#
# arrancar_equipos.sh - Un script que enciende los equipos por WOL.
#
# Este código es software libre. Puede redistribuirlo y/o modificarlo bajo los términos de la
# Licencia Pública General de GNU según es publicada por la Free Software Foundation, bien de la
# versión 2 de dicha Licencia o bien (según su elección) de cualquier versión posterior.
# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA, incluso
# sin la garantía MERCANTIL implícita o sin garantizar la CONVENIENCIA PARA UN PROPÓSITO PARTICULAR.
# Véase la Licencia Pública General de GNU para más detalles.
# Debería haber recibido una copia de la Licencia Pública General junto con este programa. Si no ha
# sido así, escriba a la Free Software Foundation, Inc., en 675 Mass Ave, Cambridge, MA 02139, EEUU.
#
# Autor: Francisco J. de la Torre Inguanzo (aka Linuxman R4).
# Blog: http://linuxmanr4.com
# G+  : https://plus.google.com/108009231243004251711
 
# Primero mostramos un menú que nos permite elegir cual (o cuales) equipos queremos arrancar.
 
while :
 do
    clear
    echo "==========================================================="
    echo ""
    echo "[1]  Equipo Uno"
    echo "[2]  Equipo Dos"
    echo "[3]  Equipo Tres"
    echo "[4]  TODOS los anteriores"
    echo ""
    echo "[q]  Salir"
    echo "==========================================================="
    echo "Seleccione su opción [1-4,q] :"
   
    read opcion    
 
    case $opcion in
        # Recuerden sustituir las mac address por las de sus equipos.
        1) sudo etherwake 11:11:11:11:11:11 ; echo "Señal de encendido enviada... presione una tecla para continuar."; read;;
        2) sudo etherwake 22:22:22:22:22:22 ; echo "Señal de encendido enviada... presione una tecla para continuar."; read;;
        3) sudo etherwake 33:33:33:33:33:33 ; echo "Señal de encendido enviada... presione una tecla para continuar."; read;;
        4)
            sudo etherwake 11:11:11:11:11:11 ;
            sudo etherwake 22:22:22:22:22:22 ;
            sudo etherwake 33:33:33:33:33:33 ;
            echo "Señal de encendido enviada a todos los servidores... presione una tecla para continuar."; read;;
                   
        q) printf "Hasta la próxima!!!\n"; exit 0 ;;    
    esac
done
