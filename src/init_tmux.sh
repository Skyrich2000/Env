command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists tmux; then
		echo "Install tmux"
		$1 apt install -y tmux
	fi
}

config() {
	cp ../res/.zshrc ~
	cp ../res/.tmux.conf ~
	cp ../res/.tmux.reset.conf ~
	cp -rf ./res/mine ~/.tmuxe
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
}

main $1
