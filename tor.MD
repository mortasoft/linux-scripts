# Cómo crear un sitio en Tor Hidden Services

## 1. Abrir la terminal y loguearse como Root
```bash
sudo su -
```
## 2. Instalar los paquetes requeridos
```bash
apt install -y gpg apt-transport-https software-properties-common curl
```
## 3. Agregar el repositorio de Tor Project
```bash
curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
apt-add-repository -s https://deb.torproject.org/torproject.org
```
## 4. Instalar Tor y Nginx
```bash
apt install -y tor nginx
```
## 5. Editar el sitio por default de Nginx
```bash
echo 'Este es una pagina montada en Tor Hidden Services' > /var/www/html/index.nginx-debian.html
```
## 6. Edite el archivo de configuracion de Tor y configure el nuevo sitio (Puede sustituir mi_sitio por lo que quiera)
```bash
echo 'HiddenServiceDir /var/lib/tor/mi_sitio/' >> /etc/tor/torrc
echo 'HiddenServicePort 80 127.0.0.1:80' >> /etc/tor/torrc
```
## 7. Reinicie el servicio de Tor
```bash
systemctl restart tor
```
## 8. Busque cual es la direccion .ONION asignada
```bash
cat /var/lib/tor/mi_sitio/hostname
# Ejemplo tsubowqcthbgkmartnjs2ongg7cee4mnqsqxhmxwksymi54czooytryd.onion
```
## 9. Busque cual es la direccion .ONION asignada
Digite la direccion obtenida en el paso anterior en el navegador Tor.
