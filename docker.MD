# Install Docker on Ubuntu 20.04
[I'm an inline-style link](https://www.google.com)

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
sudo docker images
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
