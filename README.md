scripts
=======

Scripts Útiles para el uso personal 

## Instrucciones de Instalación

```
Posicionarse en la carpeta que quiere utilizar para el repositorio
git init
git remote add origin https://github.com/mortasoft/scripts.git
git pull origin master

Para hacer commits:

git config --global user.email "correo@dominio.com"
git config --global user.name "Nombre"

git commit -a
git push origin master

Para agregar la clave SSH

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

Luego agregar el contenido de ~/.ssh/id_rsa.pub al menu de Github en configuraciones
## Prueba la conexión
ssh -T git@github.com
```
## Uso

Para actualizar el repositorio utilizar el comando:

```
git pull origin master
git config --global credential.helper 'cache --timeout=3600'
## Esto para que guarde las credenciales
git config remote.origin.url git@github.com:mortasoft/scripts.git

# Realiza el commit de los cambios
git commit -a 
# Sube los cambios a Github
git push origin master

```
