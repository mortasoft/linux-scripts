# NAS Mounting System (systemd)
This repository/documentation outlines the migration from a legacy Bash-script mount process to a robust, native systemd mount architecture. This setup prevents "already mounted" errors and secures credentials.

## 🛡️ Security Features
Credential Masking: Credentials moved from cleartext scripts to a restricted-access file.

Log Management: Configured to prevent journal flooding during network outages.

Dependency Logic: Uses network-online.target to ensure mounts only attempt after the stack is up.

## 1. Prerequisites
Ensure the CIFS helper is installed on the Ubuntu host:

```bash

sudo apt update && sudo apt install cifs-utils -y
```

Create the local mount points:
```bash
sudo mkdir -p /media/mordor /media/mordor2 /media/otros /media/cursos
```

## 2. Credential Configuration
Create a secure credentials file to store the NAS password.

Create the file:


```bash
sudo nano /etc/nas-credentials
```

Add the following content:

```plaintext
username=mortasoft
password=YOUR_PASSWORD_HERE
```

Set strict permissions (Root only):

```bash
sudo chmod 600 /etc/nas-credentials
```

## 3. Mount Unit Creation
Systemd mount units must be named after their target path. Create the following four files in /etc/systemd/system/.

"media-mordor.mount"
(Repeat the pattern above for media-mordor2.mount, media-otros.mount, and media-cursos.mount, updating the What= and Where= lines accordingly.)

```plaintext
[Unit]
Description=Mount Multimedia Share
StartLimitIntervalSec=300
StartLimitBurst=3

[Mount]
What=//192.168.1.200/Multimedia
Where=/media/mordor
Type=cifs
Options=credentials=/etc/nas-credentials,uid=1000,gid=1000,forceuid,forcegid

[Install]
WantedBy=multi-user.target
```

## 4. Manager Service
Create a manager service to trigger all mounts simultaneously.

File: /etc/systemd/system/nas.service

```plaintext
[Unit]
Description=NAS Mount Manager
After=network-online.target
Wants=network-online.target media-mordor.mount media-mordor2.mount media-otros.mount media-cursos.mount

[Service]
Type=oneshot
ExecStart=/usr/bin/true
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
## 5. Deployment
Execute these commands to initialize the new system:

```bash
# Reload systemd to recognize new files
sudo systemctl daemon-reload
```

## Enable the service and the mounts
```bash
sudo systemctl enable nas.service
sudo systemctl enable media-mordor.mount media-mordor2.mount media-otros.mount media-cursos.mount
```
## Start the service
```bash
sudo systemctl start nas.service
```
## 6. Troubleshooting & Maintenance

```bash
#Check Status: 
systemctl status nas.service

#View Logs: 
journalctl -u "media-*.mount"
```
