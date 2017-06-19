# Monta una carpeta remota por SSH
# sudo apt-get install sshfs

sshfs user@www.dominio.com:/home/user /mnt/carpeta
# El usuario debe tener permisos de escritura sobre /mnt/carpeta
sudo modprobe fuse
ssh-keygen en cliente
ssh-copy-id -i $HOME/.ssh/id_rsa.pub usuario@servidor
