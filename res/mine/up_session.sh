#!/bin/bash
source ~/.tmux/mine/util.sh "$1"

sync_session
curr=$(get_curr_name)
first=$(echo "$my_sessions" | head -n 1 | cut -d "$del" -f 3)
last=$(echo "$my_sessions" | tail -n 1 | cut -d "$del" -f 3)
if [ "$curr" == "$first" ]; then
	prev=$last
else
	prev=$(echo "$my_sessions" | grep "$del$curr$del" -B 1 | head -n 1 | cut -d "$del" -f 3)
fi

tmux switch-client -t "$prev"
display_curr
