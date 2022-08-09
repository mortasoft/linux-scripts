# Install Docker on Ubuntu 20.04

## 1. Update packages
```
sudo apt-get update
```

## 2. Install dependencies
```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

## 3. Add official GPG Docker key
```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```

## 4. Add oficial Docker Repository
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```

## 5. Install docker
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
```

## 6. Docker without sudo
```console
sudo usermod -aG docker ${USER}
su - ${USER}
```

## 7. (Optional) Test
```
sudo docker run hello-world
```

# Install Docker on Kali Linux
## 1. Add the repository

```
printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" |
  sudo tee /etc/apt/sources.list.d/docker-ce.list
```

## 2. Import the GPG Key
```
curl -fsSL https://download.docker.com/linux/debian/gpg |
  sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg
```

## 3. Install Docker
```
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
```

---

# Docker commands

## Basic commands

### Start docker instance
```
systemctl start docker
sudo systemctl enable docker
```

### Search images
```
docker search ubuntu
```

### Installed images
```
# Show installed images
sudo docker images

# Delete images with no tags
docker image prune --filter="dangling=true"
```

## Container Stats
```
docker stats
```

## Containers commands

```
# Running containers
sudo docker ps -a

# Delete container
docker rm ID

# Delete container after close
docker run --rm image_name

# Delete all containers with "Closed" state
sudo docker rm $(sudo docker ps -a -f status=exited -q)
```
### Stop and start containers
```
docker stop container-id
docker start container-id
```

## Docker hub config
```
# Login to Docker Hub
sudo docker login -u dockerhub_user

# Commit the container
sudo docker commit b7dc036f2c99

```

# Specific container configurations

## Install Portainer.io
```
# Pull docker image
docker pull portainer/portainer-ce:latest

# Create a volume to store data
docker volume create portainer_data

# Run the portainer app with the port 8000 and 9443 exposed.
docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

## Install Microsoft SQL Server
```
sudo docker pull mcr.microsoft.com/mssql/server
sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=password' --name 'sql1' -p 1401:1433 -v sql1data:/var/opt/mssql -d mcr.microsoft.com/mssql/server
sudo docker exec -it sql1 mkdir /var/opt/mssql/backup
```

### Copy SQL Backup to container
```
# Copy file to volume
docker cp CAF_CGR_SEP19 sql1:/var/opt/mssql/backup

# Run the container
docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '123456..' -Q 'RESTORE DATABASE CAF FROM DISK="/var/opt/mssql/backup/CAF_CGR_SEP19" WITH MOVE "CAF" TO "/var/opt/mssql/data/CAF.MDF", MOVE "CAF_log" TO "/var/opt/mssql/data/CAF_log.ldf"'  
```

## Install MySQL Server
```
# Download image
docker pull mysql:latest

# Create a directory to store MySql Configuration
sudo mkdir -p /root/docker/mysql/conf.d
sudo touch /root/docker/mysql/conf.d/my-custom.cnf

# Create MySQL Data Volume
sudo mkdir -p /root/docker/mysql/my-data

# Run container
docker run \
--detach \
--name=mysql01 \
--env="MYSQL_ROOT_PASSWORD=password" \
--publish 6603:3306 \
--volume=/root/docker/mysql01/conf.d:/etc/mysql/conf.d \
--volume=/root/docker/mysql01/my-data:/var/lib/mysql \
mysql:latest


# SQL console access from host
mysql -uroot -pmypassword -h127.0.0.1 -P6603;
```



### Configuration for Dbeaver
* Right click your connection, choose "Edit Connection"

* On the "Connection settings" screen (main screen) click on "Edit Driver Settings"

* Click on "Connection properties", (In recent versions it named "Driver properties")

* Right click the "user properties" area and choose "Add new property"

* Add two properties: "useSSL" and "allowPublicKeyRetrieval"

* Set their values to "false" and "true" by double clicking on the "value" column

# Install Kali Linux
```
# Run the container
docker run \
-it \
--name=kali-con \
--publish 9392:9392 \
--publish 8080:8080 \
--volume=/root/docker/kali-con:/data \
kalilinux/kali-rolling:latest

# Inside the container run the next commands
apt update
apt dist-upgrade
apt autoremove
apt clean
apt install kali-tools-top10 man-db exploitdb
exit

# In the host make a commit of the KaliContainer
docker commit kali-con my-kali
```
```
