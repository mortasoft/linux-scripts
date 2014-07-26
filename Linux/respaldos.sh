#!/bin/bash
# rsync script

ORIGEN=/home/user/Documents/
DESTINO=/media/diskid/user_backup/Documents/
 
rsync -avh --exclude="*.bak" $ORIGEN $DESTINO

