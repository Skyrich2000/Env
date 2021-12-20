C="\e[1;31m"
E="\e[0m"

echo -e "$C[DOCKER SETTING] :: start ssh setting$E"
sudo DEBIAN_FRONTEND="noninteractive" apt install -y openssh-server
mkdir ~/.ssh
chmod 700 ~/.ssh
cp /authorized_keys_docker ~/.ssh/authorized_keys
sudo sed -i "s/^.*PubkeyAuthentication.*$/PubkeyAuthentication yes/" /etc/ssh/sshd_config
sudo sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication no/" /etc/ssh/sshd_config
sudo service ssh restart

echo -e "$C[DOCKER SETTING] :: install git$E"
sudo apt install -y git

echo -e "$C[DOCKER SETTING] :: clone env repository$E"
git clone https://github.com/skyrich2000/env ~/.env

echo -e "$C[DOCKER SETTING] :: start docker setting$E"
cd ~/.env
bash apply_ubuntu.sh

echo -e "$C[DOCKER SETTING] :: change shell to zsh$E"
echo dhuni | chsh -s /usr/bin/zsh

echo -e "$C[DOCKER SETTING] :: done for user!$E"
sudo rm /install_docker_user.sh
sudo rm /authorized_keys_docker
