# Search MySQL Passwords and users.
```
tshark -r ctf-dump-v2.pcap -Y 'mysql' -T fields -e mysql.user -e mysql.passwd | sort | uniq
```

# Install Openvas
```
sudo apt install openvas
sudo gvm-setup
sudo gvm-feed-update
```

# Repair Openvas
```
sudo pg_dropcluster --stop 14 main
sudo pg_dropcluster --stop 15 main
sudo pg_createcluster 15 main
sudo systemctl restart postgresql.service
sudo gvm-check-setup
sudo runuser -u postgres -- /usr/share/gvm/create-postgresql-database
```

## Change Password
sudo runuser -u _gvm -- gvmd --create-user=admin --password=password


## Fix ARM Raspberry Pi VNC Server
https://raspberrypi.stackexchange.com/questions/60874/tightvncserver-displaying-grey-screen-on-kali-linux-upon-vnc-connection

#Edit 
~/.vnc/xstartup

```
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
startxfce4 &

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
```
