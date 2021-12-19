C="\e[1;31m"
E="\e[0m"

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install() {
	if ! command_exists vim; then
		echo -e "$C[SETTING] :: install vim$E"
		sudo apt install -y vim
	fi
	
	if ! [ -e "$HOME/.vim/autoload/plug.vim" ]; then
		echo -e "$C[SETTING] :: install vim plugin$E"
		if ! command_exists curl; then
			echo -e "Install curl"
			sudo apt install -y curl
		fi
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

config() {
	if command_exists vim; then
		echo -e "$C[SETTING] :: config vim$E"
		cp ./res/vim/.vimrc ~
		cp -rf ./res/vim/plugged ~/.vim
	else
		echo -e "$C[SETTING] :: skip config vim$E"
	fi
}

main() {
	if [ "$1" == "ubuntu" ]; then
		install
		config
	elif [ "$1" == "mac" ]; then
		config
	else
		echo -e "$C[SETTING] :: wrong input$E"
		return
	fi

	echo -e "$C[SETTING] :: done vim$E"
}

main $1
