command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists zsh; then
		echo "Install zsh"
		$1 apt install -y zsh
	fi

	if ! [ -d "$ZSH" ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
}

config() {
	cp ../res/.zshrc ~
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
