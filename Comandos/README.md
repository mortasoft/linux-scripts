# [Comandos Útiles](http://www.mortasoft.com)

Scripts Útiles para el uso personal 

## Lista los discos duros y sus particiones

```sh
lsblk
```

## Grabar la pantalla desde la terminal

```sh
sudo apt-get install libav-tools
avconv -f x11grab -s 1024x768 -r 25 -i :0.0 -qscale 0 screen.mp4
```


## Desbloquear con BlueTooth


```sh
# http://blog.desdelinux.net/blueproximity-o-como-bloquear-tu-pc-al-alejarte-con-tu-telefono-movil/
sudo apt-get install blueproximity
```

## Crear un Servidor multimedia DLNA

```sh
sudo apt-get install mediatomb
```

## Obtener la fecha de instalación del sistema

```sh
ls -lct /etc | tail -1 | awk '{print $6, $7, $8}' 
```

## Respaldar Paquetes instalados 

```sh
dpkg --get-selections > listadepaquetesdebinstalados
#Restaurando los paquetes
dpkg --set-selections < listadepaqueresdebinstalados
apt-get update
apt-get dselect-upgrade
apt-get dist-upgrade
```

## Recuperar discos duros dañados

```sh
badblocks -s -v -n -f /dev/sdb
# NTFS No se monta
sudo ntfsfix /dev/sdXY

```

## Para monitorear el ancho de banda

```sh
# g para ver una grafica
# d para estadisticas detalladas
sudo apt-get install bmon
# Para ver el consumo de ancho de banda por aplicacion
sudo apt-get install nethogs
#Limitar el ancho de banda
sudo wondershaper eth0 1024 512 
# El ejemplo anterior limita la conexión a 1024kbps de bajada y 512kbps de subida
```

## Convertir de .flv a .avi (XViD)

```sh

sudo apt install ffmpeg

ffmpeg -i video.flv -c:v mpeg4 -vtag xvid video.avi
# Convertir de TIFF a PDF
sudo apt-get install ghostscript libtiff-tools
tiff2pdf -o salida.pdf archivo.TIF
# Convertir video a GIF
ffmpeg -t 5 -ss 00:00:10 -i VIDEO SALIDA.gif
# Convertir de MKV a MP4
ffmpeg -i input.mkv -codec copy output.mp4
```

## Crear ventanas

```sh
zenity --error --text="Este es un mensaje de error"
zenity --info --text "Mensaje informativo"
```

## Muestra los archivos duplicados

```sh
# Muestra los archivos duplicados
fdupes -r /home/usuario
# Elimina los archivos
fdupes -d /home/$USER/Desktop/tecmint
```

## Parches a archivos de texto

```sh
## Crear:
diff -u archivo.antiguo archivo.nuevo >archivo.patch
## Aplicar
patch -p0 archivo.viejo <archivo.patch
```
## Monta una carpeta remota por SSH

```sh
# sudo apt-get install sshfs
sshfs user@www.dominio.com:/home/user /mnt/carpeta
# El usuario debe tener permisos de escritura sobre /mnt/carpeta
sudo modprobe fuse
ssh-keygen en cliente
ssh-copy-id -i $HOME/.ssh/id_rsa.pub usuario@servidor
```

## Desproteger PDF

```sh
qpdf --decrypt protected.pdf unprotected.pdf
# Si el archivo PDF está protegido con un password
qpdf --decrypt --password prueba1234 protected.pdf unprotected.pdf
```

## Sustituir caracteres por otro en un documento masivamente

```sh
## Reemplaza la palabra paco por Francisco
sed -i 's/paco/Francisco/g' *.txt
```

## Unir PDF

```sh
pdfunite ejemplo2.pdf ejemplo3.pdf ejemplo4.pdf ejemplo5.pdf resultado.pdf
## Separar PDF
## Separa un pdf en archivos diferentes
## -f Pagina Inicial
## -l Pagina Final
pdfseparate -f 2 -l 32 documento.pdf resultado_%d.pdf
```

## Crear archivo aleatorio

```sh
# En este caso se utiliza /dev/urandom como fuente de entropía,
# la cual se volcara en el archivo de pruebas llamado archivo.bin.
# En este ejemplo se quiso generar un archivo con un tamaño de 256 MB
# y como /dev/urandom tiene una salida de 512 bytes se utiliza la opción count=500000
dd if=/dev/urandom of=archivo.bin count=500000
```

## Ejecutar un script desde internet

```sh
wget -q -O - https://raw.githubusercontent.com/mortasoft/scripts/master/13.%20Crear%20Ventanas.sh | bash /dev/stdin
```

## Imagen a Texto

```sh
# Fuente: http://geekland.eu/extraer-texto-imagen-con-ocrfeeder/
sudo apt-get install ocrfeeder tesseract-ocr tesseract-ocr-spa tesseract-ocr-eng gocr cuneiform ocropusocrad
ocrfeeder
```

## Buscar texto

```sh
# mydomain.com 
grep -r "mydomain.com" /etc/apache2/
```

## Reiniciar Cinnamon

```sh
killall -HUP cinnamon-session
```

## Respaldo Rsync

```sh
#Respaldo RSYNC
rsync -r -t -v --progress -s mortasoft@koala:/datos/Soporte /home/mortasoft/Koala
```

## Flush Rules

```sh
iptables -F
iptables -X
iptables -Z
iptables -t nat -F
```

## Listar Archivos de una carpeta a un archivo

```sh
for f in *;do echo $f>>archivo.txt;done
```

## Docker

```sh
sudo usermod -aG docker $(whoami)
docker pull ubuntu
docker run ubuntu
#Da un shell interactivo
docker run -it ubuntu
# docker commit -m "Primera Imagen" -a "mortasoft" 7100a984f6f7 mortasoft/ubuntu1
# docker stop container-id
```

## Ataque DDOS

```sh
sudo hping3 192.232.217.2 --flood -V
```
