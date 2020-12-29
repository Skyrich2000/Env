#!/bin/bash
source ~/.tmux/mine/util.sh

curr=$(get_curr_index)
first=$(echo "$my_sessions" | head -n 1 | cut -d "$del" -f 2)
last=$(echo "$my_sessions" | tail -n 1 | cut -d "$del" -f 2)
next=$((curr + 1))
if [ $curr -eq $last ]; then
	next=$first
fi
result=$(get_name $next)

move_session() {
	set_index "$(get_name $1)" $2
}

swap_session() {
	move_session $1 0
	move_session $2 $1
	move_session 0 $2
}

if [ -z "$result" ]; then
	move_session $curr $next
#	echo "move $curr to $next"
else
	if [ $curr -eq $last ]; then
		IFS=$'\n'
		for v in $(echo "$my_sessions" | cut -d "$del" -f 2)
		do
			swap_session $v $last
#			echo "swap $v to $last"
		done
	else
		swap_session $curr $next
#		echo "swap $curr to $next"
	fi

fi

save
display_curr
