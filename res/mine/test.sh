source ~/.tmux/mine/util.sh
echo "$(get_curr_name)"
echo "$my_sessions" 
tmux display-message "answer:$1"
