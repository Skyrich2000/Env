#!/bin/bash
source ~/.tmux/plugins/mine/util.sh "$1"

sync_session
curr=$(get_curr_name)
first=$(echo "$my_sessions" | head -n 1 | cut -d "$del" -f 3)
last=$(echo "$my_sessions" | tail -n 1 | cut -d "$del" -f 3)
if [ "$curr" == "$last" ]; then
	next=$first
else
	next=$(echo "$my_sessions" | grep "$del$curr$del" -A 1 | tail -n 1 | cut -d "$del" -f 3)
fi

tmux switch-client -t "$next"
display_curr
