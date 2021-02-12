curr=$(tmux list-window | grep active | cut -d ':' -f 1)
end=$(tmux list-window | tail -n 1 | cut -d ':' -f 1)
next=$(expr $curr + 1)
if [ $curr -eq $end ]; then
	next="1"
fi
result=$(tmux list-window | cut -d ':' -f 1 | grep $next)
if [ -z "$result" ]; then
	tmux move-window -s $curr -t $next
#	echo "move $curr to $next"
else
	if [ $curr -eq $end ]; then
		list=$(tmux list-window | cut -d ":" -f 1)
		for v in $list
		do
			tmux swap-window -s $v -t $end
		done
	else
		tmux swap-window -s $curr -t $next
	fi
	tmux next-window
#	echo "swap $curr to $next"
fi
