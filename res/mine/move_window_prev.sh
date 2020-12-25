curr=$(tmux list-window | grep active | cut -d ':' -f 1)
prev=$(expr $curr - 1)
result=$(tmux list-window | cut -d ':' -f 1 | grep $prev)
if [ -z "$result" -a "$prev" -ne "0" ]; then
	tmux move-window -s $curr -t $prev
#	echo "move $curr to $prev"
else
	if [ "$prev" -eq "0" ]; then
		list=$(tmux list-window | cut -d ":" -f 1 | sort -r)
		for v in $list
		do
			tmux swap-window -s $v -t 1
#			echo "swap $v to 1"
		done
	else
		tmux swap-window -s $curr -t $prev
#		echo "swap $curr to $prev"
	fi
	tmux previous-window
fi
