command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists vim; then
		echo "Install vim"
		$1 apt install -y vim
	fi	
}

config() {
	cp ../res/.vimrc ~
}

main() {
	if [ "$1" == "docker" ]; then
		install
		config
	elif [ "$1" == "mine" ]; then
		install sudo
		config
	elif [ "$1" == "cluster" ]; then
		config
	fi
}

main $1
