#!/bin/bash
# Realizar respaldos con Rsync

ORIGEN=/home/user/Documents/
DESTINO=/media/diskid/user_backup/Documents/
REMOTO=root@192.168.0.101:/home/

# Copia los archivos del origen al destino en el mismo equipo
rsync -avh --exclude="*.bak" $ORIGEN $DESTINO

# Copiar una carpeta local a un servidor remoto
rsync -avz carpetalocal/ $REMOTO

# Copiar desde un servidor remoto a una carpeta local
rsync -avz $REMOTO carpetalocal/ 

