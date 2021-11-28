C="\e[1;31m"
E="\e[0m"

conform() {
	while true
	do
		read -p "$1 [y/n] : " yn
		case $yn in
			[Yy] ) echo "1"; break;;
			[Nn] ) echo "0"; break;;
		esac
	done
}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists tmux; then
		echo -e "$C[SETTING] :: install tmux$E"
		$1 apt install -y tmux
	fi
}

config() {
	cp ./res/tmux/.tmux.conf ~
	cp ./res/tmux/.tmux.reset.conf ~
	mkdir ~/.tmux >/dev/null 2>&1
	cp -rf ./res/tmux/plugins ~/.tmux
	tmux source-file ~/.tmux.conf
}

main() {
	if [ "$1" == "docker" ]; then
		echo -e "$C[SETTING] :: recommand not to install tmux in docker container$E"
		if [ $(conform "Continue?") -eq "1" ]; then
			install sudo
			config
		else
			printf "$C[SYSTEM] :: Canceled $E\n"
		fi
	elif [ "$1" == "mine" ]; then
		install sudo
		config
	elif [ "$1" == "cluster" ]; then
		config
	fi

	echo -e "$C[SETTING] :: done tmux$E"
}

main $1
