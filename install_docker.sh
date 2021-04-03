#!/bin/bash
C="\e[1;31m"
E="\e[0m"

if [ "$1" == "" ]; then
	echo "invalid input"
	exit
fi

if [ "$(docker ps | grep $1)" == "" ]; then
	echo "run first"
fi

echo "$Ccopy root installer to $1$E"
docker cp ./res/install_my_env_root.sh $1:/
echo "$Cinstall my env in $1$E"
docker exec -it $1 bash /install_my_env_root.sh
echo "$Ccopy user installer to $1$E"
docker cp ./res/install_my_env.sh $1:/home/dhuni/
echo "$Cinstall my env in $1$E"
docker exec -it -u 1000 $1 sudo bash /home/dhuni/install_my_env.sh
