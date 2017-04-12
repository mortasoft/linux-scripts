# Con este comando se puede saber la fecha de instalación del sistema
ls -lct /etc | tail -1 | awk '{print $6, $7, $8}' 
