# Crear archivo aleatorio
# En este caso se utiliza /dev/urandom como fuente de entropía,
# la cual se volcara en el archivo de pruebas llamado archivo.bin.
# En este ejemplo se quiso generar un archivo con un tamaño de 256 MB
# y como /dev/urandom tiene una salida de 512 bytes se utiliza la opción count=500000

dd if=/dev/urandom of=archivo.bin count=500000
