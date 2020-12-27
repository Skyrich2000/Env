path="$HOME/.tmux/mine"
space="="
del=":"

$path/sync_session.sh
curr_name=$(tmux list-session | grep attached | cut -d "$del" -f 1)
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
tmux display-message "[$curr] #S"
