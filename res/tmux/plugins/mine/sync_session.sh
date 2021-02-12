#!/bin/bash
source ~/.tmux/plugins/mine/util.sh

error=0
output=""
index_list=$(seq $(echo "$tmux_sessions" | wc -l))
new_session_list=()

IFS=$'\n'
for name in $tmux_sessions
do
	index=$(get_index "$name")
	if [ -z "$index" ]; then # if new session
		new_session_list+=($name)
		continue
	fi
	output=$output$enter$del$index$del$name$del
	index_list=$(echo "$index_list" | grep $index -v -w) # remove index
	if [ $(echo "$my_sessions" | grep "$del$index$del" | wc -l) != "1" ]; then # check double index
		error=1
		break;
	fi
done

for name in ${new_session_list[@]}
do
	index=$(echo "$index_list" | head -n 1)
	if [ -z "$index" ]; then # if no index left to assign
		error=1
		break;
	fi
	output=$output$enter$del$index$del$name$del
	index_list=$(echo "$index_list" | grep $index -v -w) # remove index
done

if [ $error == 1 ]; then
	echo "Error in sync sessions. Check $base/sessions below"
	echo "---"
	cat $base/sessions | tr "$enter" '\n'
	echo "---"
	echo "Please sync manually."
	echo "vi $base/sessions"
	exit
fi

my_sessions=$(echo "${output:1}" | tr "$enter" '\n')
save
