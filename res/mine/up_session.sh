path="$HOME/.tmux/mine"
space="="
del=":"

$path/sync_session.sh
curr_name=$(tmux list-session | grep attached | cut -d ':' -f 1)
curr=$(cat $path/sessions | grep "$curr_name" | cut -d "$del" -f 1)
end=$(cat $path/sessions | tail -n 1 | cut -d "$del" -f 1)
prev=$(expr $curr - 1)
if [ $curr -eq "1" ]; then
	prev=$end
fi
while [ -z "$(cat $path/sessions | grep $prev -w)" ]
do
	prev=$(expr $prev - 1)
done
prev_name=$(cat $path/sessions | grep $prev -w | cut -d "$del" -f 2)
tmux switch-client -t "$prev_name"
tmux display-message "[$prev] #S"
