# Search MySQL Passwords and users.
tshark -r ctf-dump-v2.pcap -Y 'mysql' -T fields -e mysql.user -e mysql.passwd | sort | uniq
