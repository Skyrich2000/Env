C="\e[1;31m"
E="\e[0m"

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists tmux; then
		echo -e "$C[SETTING] :: install tmux$E"
		sudo apt install -y tmux
	fi
}

config() {
	if command_exists tmux; then
		echo -e "$C[SETTING] :: config tmux$E"
		cp ./res/tmux/.tmux.conf ~
		cp ./res/tmux/.tmux.reset.conf ~
		mkdir ~/.tmux >/dev/null 2>&1
		cp -rf ./res/tmux/plugins ~/.tmux
		tmux source-file ~/.tmux.conf
	else
		echo -e "$C[SETTING] :: skip config tmux$E"
	fi
}

main() {
	if [ "$1" == "ubuntu" ]; then
		install
		config
	elif [ "$1" == "mac" ]; then
		config
	else
		echo -e "$C[SETTING] :: wrong input!$E"
		return
	fi

	echo -e "$C[SETTING] :: done tmux$E"
}

main $1
