# [Scripts](http://www.mortasoft.com)

Scripts Útiles para el uso personal 

## Instrucciones de Instalación en Linux

Posicionarse en la carpeta que quiere utilizar para el repositorio
```sh

git init
git remote add origin https://github.com/mortasoft/scripts.git
git pull origin master
```

Para agregar la clave SSH

```sh
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

Luego agregar el contenido de ~/.ssh/id_rsa.pub al menu de Github en configuraciones
## Este comando prueba la conexión
ssh -T git@github.com
```

Para hacer commits:

```sh
git config --global user.email "correo@dominio.com"
git config --global user.name "Nombre"

git commit -a
git push origin master
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
## Nota

Si no accesa por ssh eliminar los archivos y generarlos de nuevo

Para arreglar si clonamos mediante HTTPS y no mediante SSH
git remote set-url origin git@github.com:mortasoft/linux-scripts.git

# EC2
Para conectarse a instancias EC2 sin poner credenciales realizar lo siguiente

```
nano ~/.ssh/config
```

```
Host ec2
  Hostname ec2-35-169-93-188.compute-1.amazonaws.com
  user ubuntu
  IdentityFile ~/.ssh/my-aws-key.pem
  Port 22
```

```
ssh ec2
```
