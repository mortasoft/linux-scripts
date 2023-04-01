https://import.cdn.thinkific.com/337008/courses/2237962/NetworkChuck30WindowsCommandLineCheatSheet-230327-093753.pdf

## Always open command prompt in admninistrator Mode

`` runas /user:Administrator cmd ``

## Hide zip or rar files inside an image

`` copy /b image.extension+folder.zip image.extension`` 

## Encrypt files in a folder
``cipher /E``

## Hide a folder from everyone
``` # Hide
attrib +h +s +r foldername

# Unhide
attrib h s r foldername
```

## Show all wifi passwords
``` # Shows a specific network
 netsh wlan show profile Mordor key=clear | findstr "clave" # Espanol
 netsh wlan show profile Mordor key=clear | findstr "key"   # Ingles

 # Shows all networks
 for /f "skip=9 tokens=1,2 delims=:" %i in ('netsh wlan show profiles') do @if "%j" NEQ "" (echo SSID: %j & netsh wlan show profiles %j key=clear | findstr "clave") & echo.

# Save to file 
for /f "skip=9 tokens=1,2 delims=:" %i in ('netsh wlan show profiles') do @if "%j" NEQ "" (echo SSID: %j & netsh wlan show profiles %j key=clear | findstr "clave") >> claves.txt

```

# System Information

```
#Display detailed system operating and configuration info
systeminfo

#Securely Copy files between remote hosts
scp file.txt root@serverip:~/file.txt

#Map a regular folder as a mounted drive
subst q: c://filelocation

#Remove the Mounted Drive
subst /d q:

```
