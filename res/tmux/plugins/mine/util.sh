base="$HOME/.tmux/plugins/mine"
enter=';'
del=':'

client=$(tmux list-clients | grep "$1" | cut -d ':' -f 1 | tail -n 1)
tmux_sessions=$(tmux list-sessions | cut -d ':' -f 1 )
my_sessions=$(cat $base/sessions | tr "$enter" '\n')

# sort and save 
save() {
	echo "$my_sessions" | sort -t ':' -k2n | tr '\n' "$enter" > $base/sessions
} 

# most : name
# return : index or null
get_index() {
	local name=$1
	echo "$my_sessions" | grep "$del$name$del" | cut -d "$del" -f 2
}


# most : name , newindex
set_index() {
	local name=$1 
	local newindex=$2
	local output=$(echo "$my_sessions" | grep "$del$name$del" -v)
	local new="$del$newindex$del$name$del"
	if [ "$name" != "" ]; then
		my_sessions=$(echo "$output$enter$new" | tr "$enter" '\n')
	fi
}

# return : name
get_curr_name() {
	tmux list-clients | grep "$client" | sed -e "s/.*\b: \b//g" -e "s/\b \[\b.*//g"
}

# return : index or null
get_curr_index() {
	get_index "$(get_curr_name)"
}

# must : index
# return : name or null
get_name() {
	local index=$1
	echo "$my_sessions" | grep "$del$index$del" | cut -d "$del" -f 3
}

# must : exists index , new name
set_name() {
	local index=$1
	local newname=$2
	local output=$(echo "$my_sessions" | grep "$del$index$del" -v)
	local new="$del$index$del$newname$del"	
	if [ "$index" != "" ]; then
		my_sessions=$(echo "$output$enter$new" | tr "$enter" '\n')
	fi
}

sync_session() {
	local my_num=$(echo "$my_sessions" | wc -l)
	local tmux_num=$(echo "$tmux_sessions" | wc -l)
	if [ "$my_num" != "$tmux_num" ]; then
		source ~/.tmux/plugins/mine/sync_session.sh
	fi
}

display_curr() {
	tmux display-message " [$(get_curr_index)] $(get_curr_name)"
}
