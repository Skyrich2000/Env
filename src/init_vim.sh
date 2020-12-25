command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists vim; then
		echo "[SETTING] :: install vim"
		$1 apt install -y vim
	fi
	
	if ! [ -e "$HOME/.vim/autoload/plug.vim" ]; then
		echo "[SETTING] :: install vim plugin"
		if ! command_exists curl; then
			echo "Install curl"
			$1 apt install -y curl
		fi
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

config() {
	cp ./res/.vimrc ~
	echo "[SETTING] :: do :PlugInstall"
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

	echo "[SETTING] :: done vim"
}

main $1
