path="$HOME/.tmux/mine"
space="="
del=":"

$path/sync_session.sh
curr_name=$(tmux list-session | grep attached | cut -d ':' -f 1)
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
end=$(cat $path/sessions | tail -n 1 | cut -d "$del" -f 1)
next=$(expr $curr + 1)
if [ $curr -eq $end ]; then
	next="1"
fi
while [ -z "$(cat $path/sessions | grep $next -w)" ]
do
	next=$(expr $next + 1)
done
next_name=$(cat $path/sessions | grep $next -w | cut -d "$del" -f 2)
tmux switch-client -t "$next_name"
tmux display-message "[$next] #S"
