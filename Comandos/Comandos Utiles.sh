# Lista los discos duros y sus particiones
lsblk


# Comando para grabar la pantalla desde la terminal
# sudo apt-get install libav-tools
avconv -f x11grab -s 1024x768 -r 25 -i :0.0 -qscale 0 screen.mp4


# http://blog.desdelinux.net/blueproximity-o-como-bloquear-tu-pc-al-alejarte-con-tu-telefono-movil/
sudo apt-get install blueproximity


# Servidor multimedia DLNA
sudo apt-get install mediatomb


# Con este comando se puede saber la fecha de instalación del sistema
ls -lct /etc | tail -1 | awk '{print $6, $7, $8}' 


# Respaldar paquetes instalados
dpkg --get-selections > listadepaquetesdebinstalados
#Restaurando los paquetes
dpkg --set-selections < listadepaqueresdebinstalados
apt-get update
apt-get dselect-upgrade
apt-get dist-upgrade


# Recuperar discos duros dañados
badblocks -s -v -n -f /dev/sdb


# Para monitorear el ancho de banda
# g para ver una grafica
# d para estadisticas detalladas
sudo apt-get install bmon


# Para ver el consumo por aplicacion
sudo apt-get install nethogs


#Limitar el ancho de banda
sudo wondershaper eth0 1024 512 
# El ejemplo anterior limita la conexión a 1024kbps de bajada y 512kbps de subida


# Convertir de .flv a .avi (XViD)
ffmpeg -i video.flv -c:v mpeg4 -vtag xvid video.avi


# Crear ventanas
zenity --error --text="Este es un mensaje de error"
zenity --info --text "Mensaje informativo"


# Muestra los archivos duplicados
fdupes -r /home/usuario
# Elimina los archivos
fdupes -d /home/$USER/Desktop/tecmint


## Con este comando se puede crear parches a archivos de texto
## Crear:
diff -u archivo.antiguo archivo.nuevo >archivo.patch
## Aplicar
patch -p0 archivo.viejo <archivo.patch


# Monta una carpeta remota por SSH
# sudo apt-get install sshfs
sshfs user@www.dominio.com:/home/user /mnt/carpeta
# El usuario debe tener permisos de escritura sobre /mnt/carpeta
sudo modprobe fuse
ssh-keygen en cliente
ssh-copy-id -i $HOME/.ssh/id_rsa.pub usuario@servidor


# Desproteger PDF
qpdf --decrypt protected.pdf unprotected.pdf
# Si el archivo PDF está protegido con un password
qpdf --decrypt --password prueba1234 protected.pdf unprotected.pdf


# Este comando sirve para sustituir caracteres por otro en un documento masivamente
## Reemplaza la palabra paco por Francisco
sed -i 's/paco/Francisco/g' *.txt


## Unir PDF:
pdfunite ejemplo2.pdf ejemplo3.pdf ejemplo4.pdf ejemplo5.pdf resultado.pdf
## Separar PDF
## Separa un pdf en archivos diferentes
## -f Pagina Inicial
## -l Pagina Final
pdfseparate -f 2 -l 32 documento.pdf resultado_%d.pdf


# Crear archivo aleatorio
# En este caso se utiliza /dev/urandom como fuente de entropía,
# la cual se volcara en el archivo de pruebas llamado archivo.bin.
# En este ejemplo se quiso generar un archivo con un tamaño de 256 MB
# y como /dev/urandom tiene una salida de 512 bytes se utiliza la opción count=500000
dd if=/dev/urandom of=archivo.bin count=500000


#Con este script se puede ejecutar un script desde internet.
wget -q -O - https://raw.githubusercontent.com/mortasoft/scripts/master/13.%20Crear%20Ventanas.sh | bash /dev/stdin


# Fuente: http://geekland.eu/extraer-texto-imagen-con-ocrfeeder/
sudo apt-get install ocrfeeder tesseract-ocr tesseract-ocr-spa tesseract-ocr-eng gocr cuneiform ocropusocrad
ocrfeeder


# NTFS No se monta
sudo ntfsfix /dev/sdXY
# Ejemplo sudo ntfsfix /dev/sde1


# Convertir de .flv a .avi (XViD)
sudo apt install ffmpeg
ffmpeg -i video.flv -c:v mpeg4 -vtag xvid video.avi
# Convertir de TIFF a PDF
sudo apt-get install ghostscript libtiff-tools
tiff2pdf -o salida.pdf archivo.TIF
# Convertir video a GIF
ffmpeg -t 5 -ss 00:00:10 -i VIDEO SALIDA.gif
# Convertir de MKV a MP4
ffmpeg -i input.mkv -codec copy output.mp4
