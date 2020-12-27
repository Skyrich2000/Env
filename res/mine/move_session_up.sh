path="$HOME/.tmux/mine"
space="="
del=":"

curr_name=$(tmux list-session | grep attached | cut -d ':' -f 1)
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
prev=$(expr $curr - 1)
result=$(cat $path/sessions | cut -d "$del" -f 1 | grep $prev -w)

move_session() {
	other=$(cat $path/sessions | grep $1 -w -v)
	new=$(cat $path/sessions | grep $1 -w | sed "s/$1$del/$2$del/g")
	echo "$other\n$new" > $path/sessions
#	echo "move $1 to $2"
}

swap_session() {
	move_session $1 0
	move_session $2 $1
	move_session 0 $2
}

if [ -z "$result" -a "$prev" -ne "0" ]; then
	move_session $curr $prev
#	echo "move $curr to $prev"
else
	if [ $prev -eq "0" ]; then
		list=$(cat $path/sessions | cut -d "$del" -f 1 | sort -r)
		for v in $list
		do
			swap_session $v 1
#			echo "swap $v to $1"
		done
	else
		swap_session $curr $prev
#		echo "swap $curr to $prev"
	fi

fi

$path/sync_session.sh
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
tmux display-message "[$curr] #S"

