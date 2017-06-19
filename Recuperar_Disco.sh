# Escanea el disco en busca de badblocks
badblocks -s -v -n -f /dev/sdb

# Use badblocks and fdisk to remove bad blocks
sudo badblocks /dev/sdb > /home/bad-blocks
sudo fdisk -l /home/bad-blocks /dev/sdb
