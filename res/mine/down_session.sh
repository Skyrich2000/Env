#!/bin/bash
source ~/.tmux/mine/sync_session.sh
source ~/.tmux/mine/util.sh

curr=$(get_curr_index)
if [ $curr -eq $my_session_num ]; then
	next_name=$(echo "$my_sessions" | head -n 1 | cut -d "$del" -f 3)
else
	next_name=$(echo "$my_sessions" | grep "$del$curr$del" -A 1 | tail -n 1 | cut -d "$del" -f 3)
fi

tmux switch-client -t "$next_name"
display_curr
