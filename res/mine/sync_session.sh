path="$HOME/.tmux/mine"
space='='
del=':'

count=0
output=""
names=$(tmux list-sessions | cut -d ':' -f 1 | sed "s/ /$space/g")
for v in $names
do
	new=$(cat $path/sessions | sed "s/ /$space/g" | grep $v) # find same name
	if [ -z "$new" ]; then
		continue
	fi
	count=$((count + 1))
	new=$(echo $new | sed "s/$space/ /g")
	if [ -z "$output" ]; then
		output=$new
	else
		output=$output'\n'$new
	fi
	names=$(echo "$names" | grep $v -v) # remove names
done	

for v in $names
do
	count=$((count + 1))
	while [ -n "$(cat $path/sessions | grep $count -w)" ]
	do
		count=$((count + 1))
	done
	new="$count$del$v"
	new=$(echo $new | sed "s/$space/ /g")
	if [ -z "$output" ]; then
		output=$new
	else
		output=$output'\n'$new
	fi
done

output=$(echo $output | sort)
echo "$output" > $path/sessions
