C="\e[1;31m"
E="\e[0m"

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists zsh; then
		echo -e "$C[SETTING] :: install zsh$E"
		$1 apt install -y zsh
	fi

	if ! [ -d "$ZSH" ]; then
		if ! command_exists curl; then
			echo -e "$C[SETTING] :: install curl$E"
			$1 apt install -y curl
		fi
		echo -e "$C[SETTING] :: install oh-my-zsh$E"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --keep-zshrc --unattended
	fi
}

config() {
	cp ./res/.zshrc ~
	cp ./res/agnoster.zsh-theme ~/.oh-my-zsh/themes/
}

main() {
	if [ "$1" == "docker" ]; then
		install sudo
		echo "export LC_ALL=C.UTF-8" > ~/.zshenv
		config
	elif [ "$1" == "mine" ]; then
		install sudo
		config
	elif [ "$1" == "cluster" ]; then
		config
	fi

	echo -e "$C[SETTING] :: done zsh$E"
}

main $1
