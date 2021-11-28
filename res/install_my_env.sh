C="\e[1;31m"
E="\e[0m"
echo -e "$C[DOCKER SETTING] :: install git$E"
sudo apt install -y git
echo -e "$C[DOCKER SETTING] :: clone git$E"
git clone https://github.com/skyrich2000/env ~/.myenv
echo -e "$C[DOCKER SETTING] :: start docker setting$E"
cd ~/.myenv
bash docker.sh
echo -e "$C[DOCKER SETTING] :: change shell to zsh$E"
echo dhuni | chsh -s /usr/bin/zsh
echo -e "$C[DOCKER SETTING] :: start ssh setting$E"
sudo DEBIAN_FRONTEND="noninteractive" apt install -y openssh-server
mkdir ~/.ssh
chmod 700 ~/.ssh
cp /authorized_keys_docker ~/.ssh/authorized_keys
sudo sed -i "s/^.*PubkeyAuthentication.*$/PubkeyAuthentication yes/" /etc/ssh/sshd_config
sudo sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication no/" /etc/ssh/sshd_config
sudo service ssh restart
echo -e "$C[DOCKER SETTING] :: delete$E"
sudo rm /install_my_env.sh
sudo rm /authorized_keys_docker
