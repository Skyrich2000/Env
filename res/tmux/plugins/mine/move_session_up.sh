#!/bin/bash
source ~/.tmux/plugins/mine/util.sh "$1"

curr=$(get_curr_index)
prev=$((curr - 1))
result=$(get_name $prev)

move_session() {
	set_index "$(get_name $1)" $2
}

swap_session() {
	move_session $1 0
	move_session $2 $1
	move_session 0 $2
}

if [ -z "$result" -a "$curr" -ne "1" ]; then
	move_session $curr $prev
#	echo "move $curr to $prev"
else
	if [ $curr -eq "1" ]; then
		IFS=$'\n'
		for v in $(echo "$my_sessions" | cut -d "$del" -f 2 | sort -nr)
		do
			swap_session $v 1
#			echo "swap $v to 1"
		done
	else
		swap_session $curr $prev
#		echo "swap $curr to $prev"
	fi
fi

save
display_curr
