command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists tmux; then
		echo "[SETTING] :: install tmux"
		$1 apt install -y tmux
	fi
}

config() {
	cp ./res/.tmux.conf ~
	cp ./res/.tmux.reset.conf ~
	mkdir ~/.tmux >/dev/null 2>&1
	cp -rf ./res/mine ~/.tmux
	tmux source-file ~/.tmux.conf
}

main() {
	if [ "$1" == "docker" ]; then
		#install
		#config
		echo "recommand not to install tmux in docker container"
	elif [ "$1" == "mine" ]; then
		install sudo
		config
	elif [ "$1" == "cluster" ]; then
		config
	fi

	echo "[SETTING] :: tmux done"
}

main $1
