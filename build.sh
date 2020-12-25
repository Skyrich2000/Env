C="\e[1;31m"
E="\e[0m"

cp ~/.zshrc ./res
cp ~/.vimrc ./res
cp ~/.tmux.conf ./res
cp ~/.tmux.reset.conf ./res
cp -rf ~/.tmux/mine ./res

git add .
git commit -m "update : $(date)"
git push

echo -e "$C[SETTING] :: done update$E"
