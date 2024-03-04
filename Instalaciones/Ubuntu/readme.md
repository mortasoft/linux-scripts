sudo apt install gnome-tweaks
sudo apt install numix-icon-theme-circle

# Docker
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

# MEGA
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb && sudo apt install "$PWD/megasync-xUbuntu_22.04_amd64.deb"

sudo apt install vlc
sudo apt install obs-studio 
sudo apt install steam
sudo apt install guake

# Github Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop

sudo apt install gnome-libsecret
sudo apt install gnome-keyring

sudo apt-get install mysql-client

sudo apt-get install mysql-client
sudo apt-get install libmysqlclient15-dev
sudo apt install python-mysqldb
sudo apt install plocate
sudo apt install dbbeaver

sudo apt install opera
sudo apt install brave
sudo apt install openvpn

sudo apt-get install network-manager-openvpn-gnome

sudo apt install flameshot
sudo apt install calibre

# VirtualBox
curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/oracle_vbox.gpg
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt install -y linux-headers-$(uname -r) dkms
sudo apt install virtualbox-7.0 -y

sudo apt install httrack webhttrack
sudo apt install hashcat-nvidia


# Forticlient
wget -O - https://repo.fortinet.com/repo/7.0/ubuntu/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://repo.fortinet.com/repo/7.0/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list.d/forticlient.list'

# Papirus
sudo add-apt-repository ppa:papirus/papirus
sudo apt update && sudo apt install papirus-icon-theme

sudo apt-get -y install arc-theme

sudo apt install wireshark
sudo apt install cheese
sudo apt install ntfs-3g
sudo apt install htop
sudo apt install lm-sensors 


sudo apt install vokoscreen

# Space Explorer
sudo apt install baobab 
sudo apt install joplin
sudo apt install tightvnc



