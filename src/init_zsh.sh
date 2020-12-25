command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists zsh; then
		echo "[SETTING] :: install zsh"
		$1 apt install -y zsh
	fi

	if ! [ -d "$ZSH" ]; then
		if ! command_exists curl; then
			echo "[SETTING] :: install curl"
			$1 apt install -y curl
		fi
		echo "[SETTING] :: install language pack"
		$1 apt install -y language-pack-en
		echo "[SETTING] :: install oh-my-zsh"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --keep-zshrc
	fi
}

config() {
	cp ./res/.zshrc ~
}

main() {
	if [ "$1" == "docker" ]; then
		config
		install
	elif [ "$1" == "mine" ]; then
		config
		install sudo
	elif [ "$1" == "cluster" ]; then
		config
	fi

	echo "[SETTING] :: done zsh"
}

main $1
