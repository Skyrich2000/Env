C="\e[1;31m"
E="\e[0m"

cp ~/.zshrc ./res
cp ~/.vimrc ./res
cp ~/.tmux.conf ./res
cp ~/.tmux.reset.conf ./res
cp -rf ~/.tmux/mine ./res

message=""
if [ "$1" != "" ]; then
	message=" | $1"
fi

git add .
git commit -m "update : $(date) $message"
git push

echo -e "$C[SETTING] :: done update$E"
