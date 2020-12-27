path="$HOME/.tmux/mine"
space="="
del=":"

curr_name=$(tmux list-session | grep attached | cut -d ':' -f 1)
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
end=$(cat $path/sessions | tail -n 1 | cut -d "$del" -f 1)
next=$(expr $curr + 1)
if [ $curr -eq $end ]; then
	next="1"
fi
result=$(cat $path/sessions | cut -d "$del" -f 1 | grep $next -w)

move_session() {
	other=$(cat $path/sessions | grep $1 -w -v)
	new=$(cat $path/sessions | grep $1 -w | sed "s/$1$del/$2$del/g")
	echo "${other}\n${new}" > $path/sessions
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
	if [ $curr -eq $end ]; then
		list=$(cat $path/sessions | cut -d "$del" -f 1)
		for v in $list
		do
			swap_session $v $end
#			echo "swap $v to $end"
		done
	else
		swap_session $curr $next
#		echo "swap $curr to $next"
	fi

fi

$path/sync_session.sh	
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
tmux display-message "[$curr] #S"

