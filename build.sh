C="\e[1;31m"
E="\e[0m"

# zsh
rm -rf ./res/zsh
mkdir ./res/zsh
cp ~/.zshrc ./res/zsh
cp ~/.zshenv ./res/zsh
cp ~/.oh-my-zsh/themes/agnoster_mine.zsh-theme ./res/zsh
find ~/.oh-my-zsh/custom/plugins -name ".git" -exec rm -rf {} \;
cp -rf ~/.oh-my-zsh/custom/plugins ./res/zsh

# vim
rm -rf ./res/vim
mkdir ./res/vim
cp ~/.vimrc ./res/vim
find ~/.vim/plugged -name ".git" -exec rm -rf {} \;
cp -rf ~/.vim/plugged ./res/vim

# tmux
rm -rf ./res/tmux
mkdir ./res/tmux
cp ~/.tmux.conf ./res/tmux
cp ~/.tmux.reset.conf ./res/tmux
find ~/.tmux/plugins -name ".git" -exec rm -rf {} \;
cp -rf ~/.tmux/plugins ./res/tmux

message=""
if [ "$1" != "" ]; then
	message=" | $1"
fi

git status
git add .
git commit -m "update : $(date) $message"
git push

echo "$C[SETTING] :: done update$E"
