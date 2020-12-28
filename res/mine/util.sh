base="$HOME/.tmux/mine"
enter=';'
del=':'
del2='='

tmux_sessions=$(tmux list-sessions | cut -d ':' -f 1 )
my_sessions=$(cat $base/sessions | tr "$enter" '\n')

tmux_session_num=$(echo "$tmux_sessions" | wc -l)
my_session_num=$(echo "$my_sessions" | wc -l)

# sort and save 
save() {
	echo "$my_sessions" | sort -t ':' -k2n | tr '\n' "$enter" > $base/sessions
} 

# most : name
# return : index or null
get_index() {
	local name=$1
	echo "$my_sessions" | grep "$del$name$del" | cut -d "$del" -f 2 | cat
}


# most : name , newindex
set_index() {
	local name=$1 
	local newindex=$2
	local output=$(echo "$my_sessions" | grep $del$name$del -v)
	local new="$del$newindex$del$name$del"	
	my_sessions=$(echo "$output$enter$new" | tr "$enter" '\n')
}

# return : name
get_curr_name() {
	tmux list-sessions | grep attached | cut -d ':' -f 1 | cat
}

# return : index or null
get_curr_index() {
	get_index "$(get_curr_name)"
}

# must : index
# return : name or null
get_name() {
	local index=$1
	echo "$my_sessions" | grep "$del$index$del" | cut -d "$del" -f 3 | cat
}

# must : exists index , new name
set_name() {
	local index=$1
	local newname=$2
	local output=$(echo "$my_sessions" | grep $del$index$del -v)
	local new="$del$index$del$newname$del"	
	my_sessions=$(echo "$output$enter$new" | tr "$enter" '\n')
}

display_curr() {
	tmux display-message " [$(get_curr_index)] #S"
}
