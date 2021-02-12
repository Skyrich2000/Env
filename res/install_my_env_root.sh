C="\e[1;31m"
E="\e[0m"
echo -e "$C[DOCKER SETTING] :: apt update$E"
apt update
echo -e "$C[DOCKER SETTING] :: install sudo$E"
apt install -y sudo
echo -e "$C[DOCKER SETTING] :: make user$E"
useradd dhuni -u 1000
name=$(cat /etc/passwd | grep 1000:. | cut -d : -f 1)
echo -e "$C[DOCKER SETTING] :: new user $name$E"
echo "$name:dhuni" | chpasswd; adduser $name sudo
echo "$name ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
mkdir -p /home/dhuni
chown -R $name:$name /home/dhuni
echo -e "$C[DOCKER SETTING] :: done for root!$E"
rm /install_my_env_root.sh
