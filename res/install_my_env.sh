C="\e[1;31m"
E="\e[0m"
echo -e "$C[DOCKER SETTING] :: install git$E"
sudo apt install -y git
echo -e "$C[DOCKER SETTING] :: clone git$E"
git clone https://github.com/skyrich2000/env ~/.myenv
echo -e "$C[DOCKER SETTING] :: start docker setting$E"
cd ~/.myenv
./docker.sh
rm ~/install_my_env.sh
