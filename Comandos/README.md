# [Comandos Útiles](http://www.mortasoft.com)

Scripts Útiles para el uso personal 

## Resetear el password de Root 
- 1: Reiniciar el equipo
- 2: Abrir el GRUB y seleccionar "Opciones Avanzadas" 
- 3: Presionar 'e' 
- 4: Buscar la linea que inicia con 'ro' y cambielo a 'rw'
- 5: Agregue ``` init=/bin/bash ``` al final de la linea
- 6: Presione ```F10```
- 7: Monte su sistema de archivos con el comando ```mount -n -o remount,rw /```
- 8: Resetea la contraseña con ```passwd root```
- 9: Digite ```exec /sbin/init``` para salir 

## Lista los discos duros y sus particiones

```sh
lsblk
```

## Descomprimir RAR

```sh
unrar x -pMIPASSWORD './*.rar'
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

## Convertir video de .flv a .avi (XViD)
```sh
sudo apt install ffmpeg
ffmpeg -i video.flv -c:v mpeg4 -vtag xvid video.avi
```

### Convertir de TIFF a PDF
```sh
sudo apt-get install ghostscript libtiff-tools
tiff2pdf -o salida.pdf archivo.TIF
```
### Convertir video a GIF
```sh
ffmpeg -t 5 -ss 00:00:10 -i VIDEO SALIDA.gif
```

### Convertir de MKV a MP4
```sh
ffmpeg -i input.mkv -codec copy output.mp4
```

## Dividir un video en un intervalo determinado

```sh
ffmpeg -i archivo.mp4 -s 0 -t 600 first-10-min.mp4
ffmpeg -i epica.mp4 -ss 1:01:30 -to 1:06:00 rivers.mp4

```

## Reducir tamaño a video
```
ffmpeg -i rivers.mp4 -vcodec libx265 -crf 28 rivers2.mp4
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

## Convertir PDF a JPG

```sh
convert -verbose -density 300 -trim -quality 100 -flatten -sharpen 0x1.0 archivo.pdf salida.jpg
## Script para hacerlo masivo

#/bin/bash
for file in *.pdf;do 
	convert -verbose -density 300 -trim -quality 100 -flatten -sharpen 0x1.0 $file $file.jpg
done

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

# Buscar archivo y quitar los mensajes de error
find / -name foo 2>/dev/null
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

## Disable Cups Service

```sh
sudo systemctl disable cups.service
```


## Importar certificado OpenVPN en Kubuntu

```sh
sudo nmcli connection import type openvpn file Zenbook.ovpn
```

## Instalar Megasync en Kali Linux
```sh
wget --inet4-only -O- https://mega.nz/linux/repo/Debian_testing/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/megasync-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/megasync-archive-keyring.gpg] https://mega.nz/linux/repo/Debian_testing ./" | sudo tee /etc/apt/sources.list.d/megasync.list
sudo apt update && sudo apt -y full-upgrade && sudo apt autoremove
sudo apt install megasync
sudo apt install nautilus-megasync
```

## Kali Linux Multiple Eth Adapters
```sh
sudo nano /etc/network/interfaces:
```
```sh
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug eth0
iface eth0 inet dhcp

allow-hotplug eth1
iface eth1 inet dhcp
```

## Actualizar repositorios en Manjaro
```
sudo pacman-mirrors --fasttrack && sudo pacman -Syuu
```

## Comando para tomar screenshots CEH
```
flameshot screen -n 1 -c --region 1367x765+80+50
```

## Comando para instlar Webmin
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list
cd ~/
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
rm jcameron-key.asc
sudo apt-get update
sudo apt-get install libapt-pkg-perl libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions
sudo apt-get install webmin
sudo reboot
