#!/bin/bash
source ~/.tmux/mine/sync_session.sh
source ~/.tmux/mine/util.sh

curr=$(get_curr_index)
if [ $curr -eq "1" ]; then
	prev_name=$(echo "$my_sessions" | tail -n 1 | cut -d "$del" -f 3)
else
	prev_name=$(echo "$my_sessions" | grep "$del$curr$del" -B 1 | head -n 1 | cut -d "$del" -f 3)
fi

tmux switch-client -t "$prev_name"
display_curr
