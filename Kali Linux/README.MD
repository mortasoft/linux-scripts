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
