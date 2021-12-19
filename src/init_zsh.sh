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
	if [ -d "$ZSH" ]; then
		echo -e "$C[SETTING] :: config zsh$E"
		cp ./res/zsh/.zshrc ~
		cp ./res/zsh/.zshenv ~
		cp ./res/zsh/agnoster_mine.zsh-theme ~/.oh-my-zsh/themes/
		cp -rf ./res/zsh/plugins ~/.oh-my-zsh/custom/
	else
		echo -e "$C[SETTING] :: skip config zsh$E"
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

	echo -e "$C[SETTING] :: done zsh$E"
}

main $1
