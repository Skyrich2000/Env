C="\e[1;31m"
E="\e[0m"

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists vim; then
		echo -e "$C[SETTING] :: install vim$E"
		$1 apt install -y vim
	fi
	
	if ! [ -e "$HOME/.vim/autoload/plug.vim" ]; then
		echo -e "$C[SETTING] :: install vim plugin$E"
		if ! command_exists curl; then
			echo -e "Install curl"
			$1 apt install -y curl
		fi
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

config() {
	cp ./res/vim/.vimrc ~
	cp -rf ./res/vim/plugged ~/.vim
}

main() {
	if [ "$1" == "docker" ]; then
		install sudo
		config
	elif [ "$1" == "mine" ]; then
		install sudo
		config
	elif [ "$1" == "cluster" ]; then
		config
	fi

	echo -e "$C[SETTING] :: done vim$E"
}

main $1
