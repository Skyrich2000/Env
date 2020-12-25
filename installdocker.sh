C="\e[1;31m"
E="\e[0m"

echo -e "$C[DOCKER SETTING] :: install git$E"
apt install -y git
echo -e "$C[DOCKER SETTING] :: clone git$E"
git clone https://github.com/skyrich2000/env
cd /env
echo -e "$C[DOCKER SETTING] :: start docker setting$E"
./docker
